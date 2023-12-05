import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import '../../View Society/Model/Society.dart';

class UpdateSocietyController extends GetxController {
  late final Society society;
  late final User user;
  var data = Get.arguments;

  var isLoading = false;

  final TextEditingController societyNameController = TextEditingController();
  final TextEditingController societyAddressController =
      TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    society = data[0];
    user = data[1];

    societyNameController.text = society.name!;
    societyAddressController.text = society.address!;
  }

  Future updateSocietyApi({
    required int societyid,
    required String token,
    required String societyname,
    required String societyaddress,
  }) async {
    isLoading = true;
    update();

    final response = await Http.post(Uri.parse(Api.update_society),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          "name": societyname,
          "address": societyaddress,
          "id": societyid
        }));

    if (response.statusCode == 200) {
      Get.offAndToNamed(viewSociety, arguments: user);

      isLoading = false;
      update();
    } else {
      Get.snackbar("Failed to Update", '');

      isLoading = false;
      update();
    }
  }
}
