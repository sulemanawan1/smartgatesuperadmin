import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miasuperadmin/Screens/Home%20Screen/Controller/home_controller.dart';
import 'package:miasuperadmin/Services/Shared%20Preferences/MySharedPreferences.dart';
import 'package:miasuperadmin/Widgets/My%20Card/my_card.dart';

import '../../Bindings/Set Routes/set_routes.dart';
import '../../Constants/constants.dart';

class HomeScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: secondaryColor,
          foregroundColor: primaryColor,
          title: Text('Home',
              style: GoogleFonts.montserrat(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 36)),
        ),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.625,
                        top: MediaQuery.of(context).size.height * 0.127),
                    child: Image.asset(
                      ('images/home3.png'),
                      height: MediaQuery.of(context).size.height * 0.600,
                      width: MediaQuery.of(context).size.width * 0.300,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.104,
                        top: MediaQuery.of(context).size.height * 0.015),
                    child: Text(
                      "Super Admin",
                      style: GoogleFonts.montserrat(
                        color: primaryColor,
                        //fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MyCard(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.104,
                            top: MediaQuery.of(context).size.width * 0.070),
                        onTap: () {
                          Get.toNamed(addSociety, arguments: controller.user);
                        },
                        text: 'Add Society/Building',
                        imgpath: 'images/home1.png',
                      ),
                      MyCard(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.020,
                            top: MediaQuery.of(context).size.width * 0.070),
                        onTap: () {
                          Get.toNamed(viewSociety, arguments: controller.user);
                        },
                        text: 'View Society/Building',
                        imgpath: 'images/home2.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  MyCard(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.104,
                        top: MediaQuery.of(context).size.height * 0.530),
                    onTap: () {
                      MySharedPreferences.deleteUserData();
                      Get.offAllNamed(login);
                    },
                    text: 'Logout',
                    imgpath: 'images/home4.png',
                  ),
                ]),
              );
            }));
  }
}
