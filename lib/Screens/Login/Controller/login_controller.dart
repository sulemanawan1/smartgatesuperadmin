import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Model/User.dart';

class LoginController extends GetxController {
  var isHidden = true;
  var isLoading = false;
  TextEditingController userCnicController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
  }

  Future loginApi(String cnic, String password) async {
    print(cnic);
    print(password);
    isLoading = true;
    update();

    final response = await Http.post(
      Uri.parse(Api.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'cnic': cnic,
        'password': password,
      }),
    );
    print(response.body);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200 && data['data']['roleid'] == 1) {
      print(data);

      final User user = User(
          id: data['data']['id'],
          firstName: data['data']['firstname'],
          lastName: data['data']['lastname'],
          cnic: data['data']['cnic'],
          roleId: data['data']['roleid'],
          roleName: data['data']['rolename'],
          image: data['data']['image'],
          address: data['data']['address'],
          mobileno: data['data']['mobileno'],
          password: data['data']['password'],
          bearerToken: data['Bearer']);

      MySharedPreferences.setUserData(user: user);

      print("-------");
      print(user.id);
      print(response.statusCode);

      Get.offAllNamed(homescreen, arguments: user);
      Get.snackbar(
          "Login Successfully", "Welcome back 😉 " + user.firstName.toString());
      isLoading = false;
      update();
    } else {
      Get.snackbar("Login Failed", '');
      isLoading = false;
      update();
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
}
