import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miasuperadmin/Bindings/Set%20Routes/set_routes.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/login_controller.dart';

class LogIn extends GetView {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Image.asset(
                      'images/Rectangle 1.png',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.66,
                          MediaQuery.of(context).size.width * 0.01,
                          MediaQuery.of(context).size.width * 0.2,
                          0),
                      child: Image.asset(
                        'images/amico.png',
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.69,
                            MediaQuery.of(context).size.height * 0.36,
                            0,
                            0),
                        child: Text('Log in',
                            style: GoogleFonts.montserrat(
                                color: primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.023,
                                fontWeight: FontWeight.w600))),
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
                          controller: controller.userCnicController,
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
                      child: MyPasswordTextFormField(
                          width: 531,
                          validator: emptyStringValidator,
                          controller: controller.userPasswordController,
                          labelText: "Password",
                          fontWeight: FontWeight.w600,
                          labelTextColor: secondaryColor,
                          hintTextColor: secondaryColor,
                          togglePasswordView: controller.togglePasswordView,
                          hintText: "Enter Password",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor,
                          obscureText: controller.isHidden),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.56,
                          MediaQuery.of(context).size.height * 0.70,
                          0,
                          0),
                      child: MyButton(
                          loading: controller.isLoading,
                          outlinedBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          width: 500,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (!controller.isLoading) {
                                controller.loginApi(
                                    controller.userCnicController.text,
                                    controller.userPasswordController.text);
                              }
                            }
                          },
                          fontWeight: FontWeight.w700,
                          name: "Log in",
                          color: secondaryColor,
                          textColor: primaryColor,
                          maxLines: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.65,
                          MediaQuery.of(context).size.height * 0.75,
                          0,
                          0),
                      child: Wrap(
                        children: [
                          const Text(
                            "Don't have an Account ?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.offAllNamed(signUp);
                              },
                              child: Text(
                                "Signup",
                                style: GoogleFonts.montserrat(
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
