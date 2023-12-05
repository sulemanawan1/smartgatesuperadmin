import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miasuperadmin/Constants/api_routes.dart';
import 'package:miasuperadmin/Widgets/Empty%20List/empty_list.dart';

import '../../Bindings/Set Routes/set_routes.dart';
import '../../Constants/constants.dart';
import '../../Widgets/Loader/loader.dart';
import '../../Widgets/My Dialog Box/my_dialog_box.dart';
import 'Controller/view_admin_detail_controller.dart';

class ViewAdminDetails extends GetView {
  ViewAdminDetailsController viewAdminDetailsController =
      Get.put(ViewAdminDetailsController());
  int? number;
  static const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAdminDetailsController>(
      init: ViewAdminDetailsController(),
      builder: (controller) => Scaffold(
          floatingActionButton: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 60, 10),
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
              child: Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {
                Get.offAndToNamed(addAdmin,
                    arguments: viewAdminDetailsController.arguments);
              },
            ),
          ),
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
              title: Text('View Admin Details',
                  style: GoogleFonts.montserrat(
                      color: primaryColor, fontWeight: FontWeight.w600))),
          body:
              // Column(children: [ViewAdminDetailsTile2()],)
              FutureBuilder(
                  future: controller.futureData,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data != null && snapshot.data!.length != 0) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.07,
                                      MediaQuery.of(context).size.width * 0.05,
                                      0,
                                      0),
                                  child: Text('Sub Admin',
                                      style: GoogleFonts.montserrat(
                                          color: primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.023,
                                          fontWeight: FontWeight.w600)),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                            0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: HexColor('#F3F3F3')),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          child: DataTable(
                                            dataRowColor: MaterialStateProperty
                                                .resolveWith((Set states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return primaryColor;
                                              }
                                              return Colors
                                                  .red; // Use the default value.
                                            }),
                                            dividerThickness: 0,
                                            columnSpacing:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                            columns: [
                                              DataColumn(
                                                  label: Text(
                                                'FirstName',
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'LastName',
                                                style: GoogleFonts.montserrat(
                                                    fontStyle: FontStyle.normal,
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Cnic',
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Address',
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Mobileno',
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                "Actions",
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                "Update",
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                "Image",
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                "Details",
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                            ],
                                            rows: List.generate(
                                                snapshot.data.length, (index) {
                                              final firstname = snapshot
                                                  .data[index].firstname;
                                              final lastname =
                                                  snapshot.data[index].lastname;
                                              final cnic =
                                                  snapshot.data[index].cnic;
                                              final address =
                                                  snapshot.data[index].address;
                                              final mobileno =
                                                  snapshot.data[index].mobileno;
                                              print(index);

                                              return (index % 2 != 0)
                                                  ? DataRow(
                                                      color:
                                                          MaterialStateProperty
                                                              .all(HexColor(
                                                                  '#F3F3F3')),
                                                      cells: [
                                                          DataCell(Container(
                                                              width: 75,
                                                              child: Text(
                                                                firstname,
                                                                style: GoogleFonts.montserrat(
                                                                    color: HexColor(
                                                                        '#000000'),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ))),
                                                          DataCell(Container(
                                                              child: Text(
                                                            lastname,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                          DataCell(Container(
                                                              child: Text(
                                                            cnic,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                          DataCell(Container(
                                                              child: Text(
                                                            address,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                          DataCell(Container(
                                                              child: Text(
                                                            mobileno,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                          DataCell(Container(
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return CustomDialog(
                                                                                image: Image.asset(
                                                                                  'images/warning.png',
                                                                                  width: 40,
                                                                                ),
                                                                                negativeBtnPressed: () {
                                                                                  Get.back();
                                                                                },
                                                                                title: "Are you sure !",
                                                                                content: "Do you want to delete this?",
                                                                                positiveBtnText: "delete",
                                                                                negativeBtnText: "Cancel",
                                                                                positiveBtnPressed: () {
                                                                                  controller.currentSubAdminId = snapshot.data[index].id;
                                                                                  controller.currentToken = viewAdminDetailsController.user!.bearerToken;
                                                                                  if (!controller.isDelete) {
                                                                                    controller.deleteSubAdminApi(controller.currentSubAdminId, controller.currentToken!);
                                                                                  }
                                                                                },
                                                                              );
                                                                            });
                                                                      },
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'images/delete_icon.svg',
                                                                        color: HexColor(
                                                                            '#262626'),
                                                                      )))),
                                                          DataCell(Container(
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        print(
                                                                            'particular user data.....${snapshot.data[index].firstname}');
                                                                        print(
                                                                            'particular user data.....${snapshot.data[index].password}');

                                                                        Get.offAndToNamed(
                                                                            updateAdmin,
                                                                            arguments: [
                                                                              snapshot.data[index],
                                                                              viewAdminDetailsController.user!.bearerToken,
                                                                              controller.arguments
                                                                            ]);
                                                                      },
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'images/update_icon.svg',
                                                                      )))),
                                                          DataCell(Container(
                                                              child:
                                                                  CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(Api
                                                                        .imageBaseUrl +
                                                                    snapshot
                                                                        .data[
                                                                            index]
                                                                        .image),
                                                          ))),
                                                          DataCell(Container(
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        final firstname = snapshot
                                                                            .data[index]
                                                                            .firstname;
                                                                        final lastname = snapshot
                                                                            .data[index]
                                                                            .lastname;
                                                                        var subadminFullName =
                                                                            firstname +
                                                                                lastname;
                                                                        Get.toNamed(
                                                                            viewAdminDetailsTile2,
                                                                            arguments: [
                                                                              snapshot.data[index].id,
                                                                              viewAdminDetailsController.user!.bearerToken,
                                                                              subadminFullName
                                                                            ]);
                                                                      },
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'images/detail_icon.svg',
                                                                      )))),
                                                        ])
                                                  : DataRow(
                                                      color:
                                                          MaterialStateProperty
                                                              .all(HexColor(
                                                                  '#FDFDFD')),
                                                      cells: [
                                                          DataCell(Text(
                                                            firstname,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )),
                                                          DataCell(Container(
                                                              child: Text(
                                                            lastname,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                          DataCell(Container(
                                                              child: Text(
                                                            cnic,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                          DataCell(Container(
                                                              child: Text(
                                                            address,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                          DataCell(Container(
                                                              child: Text(
                                                            mobileno,
                                                            style: GoogleFonts.montserrat(
                                                                color: HexColor(
                                                                    '#000000'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ))),
                                                          DataCell(Container(
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return CustomDialog(
                                                                                image: Image.asset(
                                                                                  'images/warning.png',
                                                                                  width: 40,
                                                                                ),
                                                                                negativeBtnPressed: () {
                                                                                  Get.back();
                                                                                },
                                                                                title: "Are you sure !",
                                                                                content: "Do you want to delete this?",
                                                                                positiveBtnText: "delete",
                                                                                negativeBtnText: "Cancel",
                                                                                positiveBtnPressed: () {
                                                                                  controller.currentSubAdminId = snapshot.data[index].id;
                                                                                  controller.currentToken = viewAdminDetailsController.user!.bearerToken;

                                                                                  controller.deleteSubAdminApi(controller.currentSubAdminId, controller.currentToken!);
                                                                                },
                                                                              );
                                                                            });
                                                                      },
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'images/delete_icon.svg',
                                                                      )))),
                                                          DataCell(Container(
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        print(
                                                                            'particular user data.....${snapshot.data[index].firstname}');
                                                                        print(
                                                                            'particular user data.....${snapshot.data[index].password}');

                                                                        Get.offAndToNamed(
                                                                            updateAdmin,
                                                                            arguments: [
                                                                              snapshot.data[index],
                                                                              viewAdminDetailsController.user!.bearerToken,
                                                                              controller.arguments
                                                                            ]);
                                                                      },
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'images/update_icon.svg',
                                                                      )))),
                                                          DataCell(Container(
                                                              child:
                                                                  CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(Api
                                                                        .imageBaseUrl +
                                                                    snapshot
                                                                        .data[
                                                                            index]
                                                                        .image),
                                                          ))),
                                                          DataCell(Container(
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        final firstname = snapshot
                                                                            .data[index]
                                                                            .firstname;
                                                                        final lastname = snapshot
                                                                            .data[index]
                                                                            .lastname;
                                                                        var subadminFullName =
                                                                            firstname +
                                                                                lastname;
                                                                        Get.toNamed(
                                                                            viewAdminDetailsTile2,
                                                                            arguments: [
                                                                              snapshot.data[index].id,
                                                                              viewAdminDetailsController.user!.bearerToken,
                                                                              subadminFullName
                                                                            ]);
                                                                      },
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'images/detail_icon.svg',
                                                                      )))),
                                                        ]);
                                            }),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return EmptyList(
                          name: 'No Admin',
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Loader();
                    } else {
                      return Loader();
                    }
                  })),
    );
  }
}
