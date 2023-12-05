import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';

class SignupController extends GetxController {
  var file;
  var isFile = false;
  var isHidden = true;
  var isLoading = false;

  getFile() async {
    // String? base64Image;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result != null) {
      file = File(result.files.single.path!);
      // print(file);
      isFile = true;
      update();

      // isFile = true;
      //  List<int> imageBytes = _file!.readAsBytesSync();
      //
      //  print(imageBytes);
      // base64Image = base64Encode(imageBytes);
      //  print(base64Image);

      return file;
    } else {
      // User canceled the picker
    }
  }

  TextEditingController adminFirstNameController = TextEditingController();
  TextEditingController adminLastNameController = TextEditingController();
  TextEditingController adminCnicController = TextEditingController();
  TextEditingController adminAddressController = TextEditingController();
  TextEditingController adminMobileNoController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  Future signUpApi(
      {required String firstName,
      required String lastName,
      required String cnic,
      required String address,
      required String mobileno,
      required String password,
      required File? file}) async {
    print('signup Api  Function Call');
    print("----Data----");
    print(firstName);
    print(lastName);
    print(cnic);
    print(address);
    print(mobileno);
    print(password);
    print(file);
    print("---------------------------");
    isLoading = true;
    update();
    var request = Http.MultipartRequest('POST', Uri.parse(Api.signup));
    if (file != null) {
      request.files.add(await Http.MultipartFile.fromPath('image', file.path));
    }
    request.fields['firstname'] = firstName;
    request.fields['lastname'] = lastName;
    request.fields['cnic'] = cnic;
    request.fields['address'] = address;
    request.fields['mobileno'] = mobileno;
    request.fields['roleid'] = 1.toString();
    request.fields['rolename'] = 'superadmin';
    request.fields['password'] = password;
    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);
    print(response.statusCode);

    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("User Register Successfully", "");
      Get.offAllNamed(login);
      isLoading = false;
      update();
    } else if (response.statusCode == 403) {
      var data = jsonDecode(response.body.toString());

      Get.snackbar(
        "Error",
        data.toString(),
      );
      isLoading = false;
      update();
    } else {
      Get.snackbar("Failed to Register", "");
      isLoading = false;
      update();
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
}
