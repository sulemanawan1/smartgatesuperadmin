import 'package:get/get.dart';
import 'package:miasuperadmin/Screens/Events/View/events.dart';
import 'package:miasuperadmin/Screens/Splash/View/splash_screen.dart';
import 'package:miasuperadmin/Screens/ViewNoticeBoard/View/view_notice_board.dart';

import '../../Screens/Add Admin/View/add_admin.dart';
import '../../Screens/Add Society/View/add_society.dart';
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

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashScreen());
    Get.lazyPut(() => AddAdmin());
    Get.lazyPut(() => AddSociety());
    Get.lazyPut(() => ViewEvents());
    Get.lazyPut(() => HomeScreen());
    Get.lazyPut(() => LogIn());
    Get.lazyPut(() => SignUp());
    Get.lazyPut(() => UpdateAdmin());
    Get.lazyPut(() => UpdateSociety());
    Get.lazyPut(() => ViewAdminDetails());
    Get.lazyPut(() => ViewAdminDetailsTile2());
    Get.lazyPut(() => ViewGateKeepers());
    Get.lazyPut(() => ViewSociety());
    Get.lazyPut(() => ViewUsers());
    Get.lazyPut(() => ViewAdminDetails());
    Get.lazyPut(() => ViewNotioceBoard());
  }
}
