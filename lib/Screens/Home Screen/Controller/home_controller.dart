import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Login/Model/User.dart';

class HomeController extends GetxController

{ var userdata = Get.arguments;
late final User user;


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this.user=userdata;
  }

}