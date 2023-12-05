import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'Bindings/Routes/routes.dart';
import 'Bindings/Screen Bindings/screen_bindings.dart';
import 'Bindings/Set Routes/set_routes.dart';
import 'Screens/Login/Model/User.dart';
import 'Services/Shared Preferences/MySharedPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    minimumSize: Size(800, 600),
    // maximumSize:Size(MediaQuery.of(context).size.width, 1024),
    center: true,
    backgroundColor: Colors.transparent,
    // skipTaskbar: false,
    // titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    getUserSharedPreferencesData();
  }
  void getUserSharedPreferencesData() async
  {
    User user= await MySharedPreferences.getUserData();
    print(user.bearerToken);
    if( user.bearerToken=="")
    {
      Timer(Duration(seconds: 3), ()=>  Get.offAndToNamed(login)    );

    }
    else {
      Timer(
          Duration(seconds: 3), () => Get.offAndToNamed(homescreen, arguments: user));
    }

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Pages().getPages(),
      initialRoute: splash,
      initialBinding: ScreenBindings(),
      debugShowCheckedModeBanner: false,


    );
  }
}
