import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bindings/Set Routes/set_routes.dart';
import '../../Constants/constants.dart';
import '../../Widgets/My Card/my_card.dart';

class ViewAdminDetailsTile2 extends GetView {
  var argument = Get.arguments;

  var SubAdminName;
  @override
  Widget build(BuildContext context) {
    SubAdminName = argument[2];
    return Scaffold(
        appBar: AppBar(
            backgroundColor: secondaryColor,
            foregroundColor: primaryColor,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back_outlined))),
            title: Text(
              "Sub Admin",
              style: GoogleFonts.montserrat(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 32),
            )),
        body: Stack(children: [
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
              "Sub Admin Society",
              style: GoogleFonts.montserrat(
                color: primaryColor,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: MediaQuery.of(context).size.width * 0.040,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MyCard(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.104,
                        top: MediaQuery.of(context).size.width * 0.070),
                    onTap: () {
                      Get.toNamed(viewUsers, arguments: argument);
                    },
                    text: "Residents",
                    imgpath: 'images/residents.png',
                  ),
                  MyCard(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.030,
                        top: MediaQuery.of(context).size.width * 0.070),
                    imgpath: 'images/gatekeeper.png',
                    onTap: () {
                      Get.toNamed(viewGateKeepers, arguments: argument);
                    },
                    text: "GateKeepers",
                  ),
                ],
              ),
              Row(
                children: [
                  MyCard(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.104,
                        top: MediaQuery.of(context).size.height * 0.015),
                    imgpath: 'images/events.png',
                    onTap: () {
                      Get.toNamed(viewevents, arguments: argument);
                    },
                    text: "Events",
                  ),
                  MyCard(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.030,
                        top: MediaQuery.of(context).size.height * 0.015),
                    onTap: () {
                      Get.toNamed(viewnoticeboard, arguments: argument);
                    },
                    imgpath: 'images/noticeboard.png',
                    text: 'Notice Board',
                  )
                ],
              )
            ],
          ),
        ]));
  }
}
