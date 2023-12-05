import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/add_admin_controller.dart';

class AddAdmin extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: primaryColor,
          title: Text(
            'Add Admin',
            style: GoogleFonts.montserrat(
                color: primaryColor, fontWeight: FontWeight.w600),
          ),
          backgroundColor: secondaryColor,
        ),
        body: GetBuilder<AddAdminController>(
            init: AddAdminController(),
            builder: (controller) {
              return SingleChildScrollView(
                  child: Center(
                child: Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: <Widget>[
                              FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: 80.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage: controller.file == null
                                      ? AssetImage("images/user.png")
                                          as ImageProvider
                                      : FileImage(
                                          File(controller.file!.path),
                                        ),
                                ),
                              ),
                              Positioned(
                                left: 115,
                                top: 110,
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
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyTextFormField(
                                fontWeight: FontWeight.w600,
                                labelTextColor: secondaryColor,
                                hintTextColor: secondaryColor,
                                width: MediaQuery.of(context).size.width * 0.49,
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
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyTextFormField(
                                fontWeight: FontWeight.w600,
                                labelTextColor: secondaryColor,
                                hintTextColor: secondaryColor,
                                width: MediaQuery.of(context).size.width * 0.49,
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
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyTextFormField(
                                fontWeight: FontWeight.w600,
                                labelTextColor: secondaryColor,
                                hintTextColor: secondaryColor,
                                width: MediaQuery.of(context).size.width * 0.49,
                                validator: emptyStringValidator,
                                controller: controller.subAdminCnicController,
                                hintText: "Enter CNIC",
                                obscureText: false,
                                labelText: "CNIC",
                                onFocusedBorderColor: primaryColor,
                                onEnabledBorderColor: primaryColor),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyTextFormField(
                                fontWeight: FontWeight.w600,
                                labelTextColor: secondaryColor,
                                hintTextColor: secondaryColor,
                                width: MediaQuery.of(context).size.width * 0.49,
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
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyPasswordTextFormField(
                                width: MediaQuery.of(context).size.width * 0.49,
                                validator: emptyStringValidator,
                                controller:
                                    controller.subAdminPasswordController,
                                labelText: "Password",
                                fontWeight: FontWeight.w600,
                                labelTextColor: secondaryColor,
                                hintTextColor: secondaryColor,
                                togglePasswordView:
                                    controller.togglePasswordView,
                                hintText: "Enter Password",
                                onFocusedBorderColor: primaryColor,
                                onEnabledBorderColor: primaryColor,
                                obscureText: controller.isHidden),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyTextFormField(
                                fontWeight: FontWeight.w600,
                                labelTextColor: secondaryColor,
                                hintTextColor: secondaryColor,
                                width: MediaQuery.of(context).size.width * 0.49,
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
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyButton(
                                loading: controller.isLoading,
                                width: MediaQuery.of(context).size.width * 0.49,
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    if (!controller.isLoading) {
                                      controller.addAdminApi(
                                          controller
                                              .subAdminFirstNameController.text,
                                          controller
                                              .subAdminLastNameController.text,
                                          controller
                                              .subAdminCnicController.text,
                                          controller
                                              .subAdminAddressController.text,
                                          controller
                                              .subAdminMobileNoController.text,
                                          controller
                                              .subAdminPasswordController.text,
                                          controller.user!.id,
                                          controller.societyid!,
                                          controller.token!,
                                          controller.file);
                                    }
                                  }
                                },
                                fontWeight: FontWeight.w700,
                                textColor: primaryColor,
                                name: 'Save',
                                color: secondaryColor,
                                maxLines: 1),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )),
              ));
            }));
  }
}
