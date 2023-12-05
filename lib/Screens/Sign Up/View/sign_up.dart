import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../Login/View/login.dart';
import '../Controller/signup_ controller.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        print(constraints.maxWidth);
        return GetBuilder<SignupController>(
            init: SignupController(),
            builder: (signupController) {
              return SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Stack(children: [
                      Image.asset(
                        'images/Rectangle 1.png',
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.69,
                              MediaQuery.of(context).size.height * 0.01,
                              0,
                              0),
                          child: Text('Sign Up',
                              style: GoogleFonts.montserrat(
                                  color: primaryColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.023,
                                  fontWeight: FontWeight.w600))),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.68,
                            MediaQuery.of(context).size.width * 0.04,
                            0,
                            0),
                        child: Stack(
                          children: <Widget>[
                            FittedBox(
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 80.0,
                                backgroundColor: Colors.white,
                                backgroundImage: signupController.file == null
                                    ? AssetImage("images/user.png")
                                        as ImageProvider
                                    : FileImage(
                                        File(signupController.file!.path),
                                      ),
                              ),
                            ),
                            Positioned(
                              left: 115,
                              top: 110,
                              child: InkWell(
                                onTap: () async {
                                  signupController.file =
                                      await signupController.getFile();
                                  print(signupController.isFile);
                                  print(signupController.file);
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
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.56,
                            MediaQuery.of(context).size.height * 0.28,
                            0,
                            0),
                        child: MyTextFormField(
                            fontWeight: FontWeight.w600,
                            labelTextColor: secondaryColor,
                            hintTextColor: secondaryColor,
                            width: 531,
                            validator: emptyStringValidator,
                            controller:
                                signupController.adminFirstNameController,
                            hintText: "Enter First Name",
                            obscureText: false,
                            labelText: "First Name",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.56,
                            MediaQuery.of(context).size.height * 0.38,
                            0,
                            0),
                        child: MyTextFormField(
                            fontWeight: FontWeight.w600,
                            labelTextColor: secondaryColor,
                            hintTextColor: secondaryColor,
                            width: 531,
                            validator: emptyStringValidator,
                            controller:
                                signupController.adminLastNameController,
                            hintText: "Enter Last Name",
                            obscureText: false,
                            labelText: "Last Name",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.56,
                            MediaQuery.of(context).size.height * 0.48,
                            0,
                            0),
                        child: MyTextFormField(
                            fontWeight: FontWeight.w600,
                            labelTextColor: secondaryColor,
                            hintTextColor: secondaryColor,
                            width: 531,
                            validator: emptyStringValidator,
                            controller: signupController.adminCnicController,
                            hintText: "Enter CNIC",
                            obscureText: false,
                            labelText: "CNIC",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.56,
                            MediaQuery.of(context).size.height * 0.58,
                            0,
                            0),
                        child: MyTextFormField(
                            fontWeight: FontWeight.w600,
                            labelTextColor: secondaryColor,
                            hintTextColor: secondaryColor,
                            width: 531,
                            validator: emptyStringValidator,
                            controller: signupController.adminAddressController,
                            hintText: "Enter Address",
                            obscureText: false,
                            labelText: "Address",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.56,
                            MediaQuery.of(context).size.height * 0.68,
                            0,
                            0),
                        child: MyTextFormField(
                            fontWeight: FontWeight.w600,
                            labelTextColor: secondaryColor,
                            hintTextColor: secondaryColor,
                            width: 531,
                            validator: emptyStringValidator,
                            controller:
                                signupController.adminMobileNoController,
                            hintText: "Enter  MobileNo",
                            obscureText: false,
                            labelText: "MobileNo",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.56,
                            MediaQuery.of(context).size.height * 0.78,
                            0,
                            0),
                        child: MyPasswordTextFormField(
                            width: 531,
                            validator: passwordValidator,
                            controller:
                                signupController.adminPasswordController,
                            labelText: "Password",
                            fontWeight: FontWeight.w600,
                            labelTextColor: secondaryColor,
                            hintTextColor: secondaryColor,
                            togglePasswordView:
                                signupController.togglePasswordView,
                            hintText: "Enter Password",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor,
                            obscureText: signupController.isHidden),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.56,
                            MediaQuery.of(context).size.height * 0.90,
                            0,
                            0),
                        child: MyButton(
                            loading: signupController.isLoading,
                            outlinedBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            width: 520,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (!signupController.isLoading) {
                                  signupController.signUpApi(
                                      firstName: signupController
                                          .adminFirstNameController.text,
                                      lastName: signupController
                                          .adminLastNameController.text,
                                      cnic: signupController
                                          .adminCnicController.text,
                                      address: signupController
                                          .adminAddressController.text,
                                      mobileno: signupController
                                          .adminMobileNoController.text,
                                      password: signupController
                                          .adminPasswordController.text,
                                      file: signupController.file);
                                }
                              }
                            },
                            fontWeight: FontWeight.w700,
                            textColor: primaryColor,
                            name: "Sign Up",
                            color: secondaryColor,
                            maxLines: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.65,
                            MediaQuery.of(context).size.height * 0.95,
                            0,
                            0),
                        child: Wrap(
                          children: [
                            const Text(
                              "Already  Have an Account ?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogIn()),
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.montserrat(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w500),
                                )),
                          ],
                        ),
                      )
                    ])),
              );
            });
      }),
    );
  }
}
