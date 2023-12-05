import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:miasuperadmin/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/Screens/Add%20Admin/View/add_admin.dart';
import 'package:miasuperadmin/Screens/Add%20Society/View/add_society.dart';
import 'package:miasuperadmin/Screens/Events/View/events.dart';
import 'package:miasuperadmin/Screens/Splash/View/splash_screen.dart';
import 'package:miasuperadmin/Screens/ViewNoticeBoard/View/view_notice_board.dart';

import '../../Screens/Home Screen/home_screen.dart';
import '../../Screens/Login/View/login.dart';
import '../../Screens/Sign Up/View/sign_up.dart';
import '../../Screens/Update Admin/View/update_admin.dart';
import '../../Screens/Update Society/View/update_society.dart';
import '../../Screens/View Admin Details/ViewAdminDetailsTile2.dart';
import '../../Screens/View Admin Details/view_admin_details.dart';
import '../../Screens/View GateKeepers/View/gate_kpeer_screen.dart';
import '../../Screens/View Residents/View/view_residents.dart';
import '../../Screens/View Society/View/view_society.dart';

class Pages {
  List<GetPage> getPages() {
    return [
      GetPage(name: addAdmin, page: () => AddAdmin()),
      GetPage(name: addSociety, page: () => AddSociety()),
      GetPage(name: viewevents, page: () => ViewEvents()),
      GetPage(name: homescreen, page: () => HomeScreen()),
      GetPage(name: login, page: () => LogIn()),
      GetPage(name: signUp, page: () => SignUp()),
      GetPage(name: updateAdmin, page: () => UpdateAdmin()),
      GetPage(name: updateSociety, page: () => UpdateSociety()),
      GetPage(name: viewAdminDetails, page: () => ViewAdminDetails()),
      GetPage(name: viewAdminDetailsTile2, page: () => ViewAdminDetailsTile2()),
      GetPage(name: viewGateKeepers, page: () => ViewGateKeepers()),
      GetPage(name: viewSociety, page: () => ViewSociety()),
      GetPage(name: viewUsers, page: () => ViewUsers()),
      GetPage(name: viewAdminDetails, page: () => ViewAdminDetails()),
      GetPage(name: viewnoticeboard, page: () => ViewNotioceBoard()),
      GetPage(name: splash, page: () => SplashScreen()),
    ];
  }
}
