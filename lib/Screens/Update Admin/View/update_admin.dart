import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miasuperadmin/Constants/api_routes.dart';
import 'package:miasuperadmin/Widgets/My%20Password%20TextForm%20Field/my_password_textform_field.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/update_admin_controller.dart';

class UpdateAdmin extends GetView {
  UpdateAdminController updateAdminController =
      Get.put(UpdateAdminController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateAdminController>(
        init: UpdateAdminController(),
        builder: (controller) {
          print(
              'update SubAdmin screen ${controller.listOfSubAdmin!.lastname}');

          return Scaffold(
              appBar: AppBar(
                foregroundColor: primaryColor,
                title: Text("Update Admin Details"),
                backgroundColor: secondaryColor,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Form(
                      key: controller.formKey,
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Stack(
                                children: <Widget>[
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.white,
                                      backgroundImage: controller.file == null
                                          ? NetworkImage(Api.imageBaseUrl +
                                              controller.listOfSubAdmin!.image
                                                  .toString()) as ImageProvider
                                          : FileImage(
                                              File(controller.file!.path),
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 100,
                                    top: 100,
                                    child: InkWell(
                                      onTap: () async {
                                        controller.file =
                                            await controller.getFile();
                                        print(controller.isFile);
                                        print(controller.file);
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryColor),
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width * 0.02,
                                    0,
                                    0),
                                child: MyTextFormField(
                                    fontWeight: FontWeight.w600,
                                    labelTextColor: secondaryColor,
                                    hintTextColor: secondaryColor,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    validator: emptyStringValidator,
                                    controller:
                                        controller.subAdminFirstNameController,
                                    hintText: "Enter First Name",
                                    obscureText: false,
                                    labelText: "First Name",
                                    onFocusedBorderColor: primaryColor,
                                    onEnabledBorderColor: primaryColor),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width * 0.02,
                                    0,
                                    0),
                                child: MyTextFormField(
                                    fontWeight: FontWeight.w600,
                                    labelTextColor: secondaryColor,
                                    hintTextColor: secondaryColor,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    validator: emptyStringValidator,
                                    controller:
                                        controller.subAdminLastNameController,
                                    hintText: "Enter Last Name",
                                    obscureText: false,
                                    labelText: "Last Name",
                                    onFocusedBorderColor: primaryColor,
                                    onEnabledBorderColor: primaryColor),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width * 0.02,
                                    0,
                                    0),
                                child: MyTextFormField(
                                    fontWeight: FontWeight.w600,
                                    labelTextColor: secondaryColor,
                                    hintTextColor: secondaryColor,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    validator: emptyStringValidator,
                                    controller:
                                        controller.subAdminAddressController,
                                    hintText: "Enter Address",
                                    obscureText: false,
                                    labelText: "Address",
                                    onFocusedBorderColor: primaryColor,
                                    onEnabledBorderColor: primaryColor),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width * 0.02,
                                    0,
                                    0),
                                child: MyTextFormField(
                                    fontWeight: FontWeight.w600,
                                    labelTextColor: secondaryColor,
                                    hintTextColor: secondaryColor,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    validator: emptyStringValidator,
                                    controller:
                                        controller.subAdminMobileNoController,
                                    hintText: "Enter  MobileNo",
                                    obscureText: false,
                                    labelText: "MobileNo",
                                    onFocusedBorderColor: primaryColor,
                                    onEnabledBorderColor: primaryColor),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      MediaQuery.of(context).size.width * 0.02,
                                      0,
                                      0),
                                  child: MyButton(
                                    loading: controller.isLoading,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    name: 'Update',
                                    color: secondaryColor,
                                    maxLines: 1,
                                    onPressed: () {
                                      if (!controller.isLoading) {
                                        controller.updateSubAdminApi(
                                            subadminid:
                                                controller.listOfSubAdmin!.id!,
                                            subadminfirstname: controller
                                                .subAdminFirstNameController
                                                .text,
                                            subadminlastname: controller
                                                .subAdminLastNameController
                                                .text,
                                            subadminmobileno: controller
                                                .subAdminMobileNoController
                                                .text,
                                            subadminaddress: controller
                                                .subAdminAddressController.text,
                                            bearerToken: controller.token!,
                                            file: controller.file);
                                      }
                                    },
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  const Text(
                                    "Do you want to change Password ?",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return GetBuilder<
                                                      UpdateAdminController>(
                                                  init: UpdateAdminController(),
                                                  builder: (cnt) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.430,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.60,
                                                          child: Stack(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            children: <Widget>[
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    2,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    2,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                child: Form(
                                                                  key: controller
                                                                      .passowrdformKey,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: <Widget>[
                                                                      SizedBox(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.07,
                                                                      ),
                                                                      SvgPicture
                                                                          .asset(
                                                                        "images/reset_password_icon.svg",
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.15,
                                                                      ),
                                                                      MyPasswordTextFormField(
                                                                          width: MediaQuery.of(context).size.width *
                                                                              0.35,
                                                                          controller: cnt
                                                                              .subAdminPasswordController,
                                                                          validator:
                                                                              emptyStringValidator,
                                                                          labelText:
                                                                              "Password",
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          labelTextColor:
                                                                              secondaryColor,
                                                                          hintTextColor:
                                                                              secondaryColor,
                                                                          togglePasswordView: controller
                                                                              .togglePasswordView,
                                                                          hintText:
                                                                              "Enter Password",
                                                                          onFocusedBorderColor:
                                                                              primaryColor,
                                                                          onEnabledBorderColor:
                                                                              primaryColor,
                                                                          obscureText:
                                                                              controller.isHidden),
                                                                      SizedBox(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.04,
                                                                      ),
                                                                      MyButton(
                                                                        loading:
                                                                            controller.isLoading,
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.35,
                                                                        name:
                                                                            'Reset Password',
                                                                        color:
                                                                            secondaryColor,
                                                                        maxLines:
                                                                            1,
                                                                        onPressed:
                                                                            () {
                                                                          if (controller
                                                                              .passowrdformKey
                                                                              .currentState!
                                                                              .validate()) {
                                                                            if (!controller.isLoading) {
                                                                              cnt.resetPasswordApi(subadminid: controller.listOfSubAdmin!.id!, bearerToken: controller.token!, password: controller.subAdminPasswordController.text);
                                                                            }
                                                                          }
                                                                        },
                                                                      ),
                                                                      SizedBox(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.01,
                                                                      ),
                                                                      MyButton(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.35,
                                                                        name:
                                                                            'Cancel',
                                                                        textColor:
                                                                            Colors.black,
                                                                        color: HexColor(
                                                                            '#E4E4E4'),
                                                                        maxLines:
                                                                            1,
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    primaryColor,
                                                                maxRadius: 30.0,
                                                                child: Icon(
                                                                  Icons
                                                                      .password,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    );
                                                  });
                                            });
                                      },
                                      child: Text(
                                        "Reset Password",
                                        style: GoogleFonts.montserrat(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ));
        });
  }
}
