import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../View Admin Details/Model/view_admin_details_model.dart';

class UpdateAdminController extends GetxController {
  var isHidden = true;
  var isLoading = false;
  TextEditingController subAdminFirstNameController = TextEditingController();
  TextEditingController subAdminLastNameController = TextEditingController();
  TextEditingController subAdminCnicController = TextEditingController();
  TextEditingController subAdminAddressController = TextEditingController();
  TextEditingController subAdminMobileNoController = TextEditingController();
  TextEditingController subAdminPasswordController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    listOfSubAdmin = argument[0];
    token = argument[1];

    subAdminFirstNameController.text = listOfSubAdmin!.firstname!;
    subAdminLastNameController.text = listOfSubAdmin!.lastname!;
    subAdminCnicController.text = listOfSubAdmin!.cnic!;
    subAdminMobileNoController.text = listOfSubAdmin!.mobileno!;
    subAdminAddressController.text = listOfSubAdmin!.address!;
  }

  var argument = Get.arguments;
  final formKey = GlobalKey<FormState>();
  final passowrdformKey = GlobalKey<FormState>();

  SubAdmin? listOfSubAdmin;

  String? token;

  File? file;
  var isFile = false;

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result != null) {
      file = File(result.files.single.path!);
      // print(file);
      isFile = true;
      update();

      return file;
    } else {
      // User canceled the picker
    }
  }

  Future updateSubAdminApi({
    required int subadminid,
    required String subadminfirstname,
    required String subadminlastname,
    required String subadminmobileno,
    required String subadminaddress,
    required String bearerToken,
    File? file,
  }) async {
    isLoading = true;
    update();
    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request = Http.MultipartRequest('POST', Uri.parse(Api.updatesubadmin));
    request.headers.addAll(headers);

    if (file != null) {
      request.files.add(await Http.MultipartFile.fromPath('image', file.path));
    }

    request.fields['firstname'] = subadminfirstname;
    request.fields['lastname'] = subadminlastname;
    request.fields['address'] = subadminaddress;
    request.fields['mobileno'] = subadminmobileno;
    request.fields['id'] = subadminid.toString();
    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      Get.offAndToNamed(viewAdminDetails, arguments: argument[2]);

      isLoading = false;
      update();
    } else if (response.statusCode == 403) {
      Get.snackbar('Error', response.body.toString());
      isLoading = false;
      update();
    } else {
      Get.snackbar('Error', 'Something Went Wrong');
      isLoading = false;
      update();
    }
  }

  Future resetPasswordApi({
    required int subadminid,
    required String bearerToken,
    required String password,
  }) async {
    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request = Http.MultipartRequest('POST', Uri.parse(Api.resetpassword));
    request.headers.addAll(headers);

    request.fields['password'] = password;
    request.fields['id'] = subadminid.toString();
    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      subAdminPasswordController.clear();

      Get.back();
      isLoading = false;
      update();
    } else if (response.statusCode == 403) {
      Get.snackbar('Error', response.body.toString());
      isLoading = false;
      update();
    } else {
      Get.snackbar('Error', 'Something Went Wrong');
      isLoading = false;
      update();
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
