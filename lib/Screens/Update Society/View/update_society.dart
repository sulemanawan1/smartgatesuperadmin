import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/update_society_controller.dart';

class UpdateSociety extends StatefulWidget {
  const UpdateSociety({Key? key}) : super(key: key);

  @override
  State<UpdateSociety> createState() => _UpdateSocietyState();
}

class _UpdateSocietyState extends State<UpdateSociety> {
  final UpdateSocietyController updateSocietyController =
      Get.put(UpdateSocietyController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: primaryColor,
          title: Text("Update Society"),
          backgroundColor: secondaryColor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: GetBuilder<UpdateSocietyController>(
              init: UpdateSocietyController(),
              builder: (controller) {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 73, 0, 0),
                            child: Text('Update Society Details',
                                style: GoogleFonts.montserrat(
                                    color: primaryColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.023,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 73, 0, 0),
                            child: Image.asset(
                              "images/updatesociety.png",
                              width: MediaQuery.of(context).size.width * 0.22,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyTextFormField(
                                fontWeight: FontWeight.w600,
                                labelTextColor: secondaryColor,
                                hintTextColor: secondaryColor,
                                width: MediaQuery.of(context).size.width * 0.29,
                                validator: emptyStringValidator,
                                controller: controller.societyNameController,
                                hintText: "Enter Society Name",
                                obscureText: false,
                                labelText: "Society Name",
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
                                width: MediaQuery.of(context).size.width * 0.29,
                                validator: emptyStringValidator,
                                controller: controller.societyAddressController,
                                hintText: "Enter Society Address",
                                obscureText: false,
                                labelText: "Society Address",
                                onFocusedBorderColor: primaryColor,
                                onEnabledBorderColor: primaryColor),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width * 0.02, 0, 0),
                            child: MyButton(
                              width: MediaQuery.of(context).size.width * 0.29,
                              textColor: primaryColor,
                              name: "Update",
                              color: secondaryColor,
                              loading: updateSocietyController.isLoading,
                              maxLines: 1,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (!updateSocietyController.isLoading) {
                                    updateSocietyController.updateSocietyApi(
                                      societyid: controller.society.id!,
                                      token: controller.user.bearerToken!,
                                      societyname:
                                          controller.societyNameController.text,
                                      societyaddress: controller
                                          .societyAddressController.text,
                                    );
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
