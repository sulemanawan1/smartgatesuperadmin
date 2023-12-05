import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miasuperadmin/Constants/api_routes.dart';
import 'package:miasuperadmin/Constants/constants.dart';
import 'package:miasuperadmin/Widgets/Empty%20List/empty_list.dart';

import '../../../Widgets/Loader/loader.dart';
import '../Controller/view_resident_controller.dart';

class ViewUsers extends GetView {
  ViewResidentsController viewResidentsController =
      Get.put(ViewResidentsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewResidentsController>(
      init: ViewResidentsController(),
      builder: (controller) => Scaffold(
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
              'View Residents Detail',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: FutureBuilder(
              future: controller.viewResidentsApi(
                  controller.subadminid, controller.bearerToken),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null && snapshot.data!.length != 0) {
                    return SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.07,
                              MediaQuery.of(context).size.width * 0.05,
                              0,
                              0),
                          child: Text('Residents',
                              style: GoogleFonts.montserrat(
                                  color: primaryColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.023,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.05,
                                    MediaQuery.of(context).size.width * 0.05,
                                    MediaQuery.of(context).size.width * 0.05,
                                    0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: HexColor('#F3F3F3')),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: DataTable(
                                    dataRowColor:
                                        MaterialStateProperty.resolveWith(
                                            (Set states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return primaryColor;
                                      }
                                      return Colors
                                          .red; // Use the default value.
                                    }),
                                    dividerThickness: 0,
                                    columnSpacing:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        'FirstName',
                                        style: GoogleFonts.montserrat(
                                            color: HexColor('#262626'),
                                            fontWeight: FontWeight.w400),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'LastName',
                                        style: GoogleFonts.montserrat(
                                            fontStyle: FontStyle.normal,
                                            color: HexColor('#262626'),
                                            fontWeight: FontWeight.w400),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Cnic',
                                        style: GoogleFonts.montserrat(
                                            color: HexColor('#262626'),
                                            fontWeight: FontWeight.w400),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Address',
                                        style: GoogleFonts.montserrat(
                                            color: HexColor('#262626'),
                                            fontWeight: FontWeight.w400),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Mobileno',
                                        style: GoogleFonts.montserrat(
                                            color: HexColor('#262626'),
                                            fontWeight: FontWeight.w400),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Image",
                                        style: GoogleFonts.montserrat(
                                            color: HexColor('#262626'),
                                            fontWeight: FontWeight.w400),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Details",
                                        style: GoogleFonts.montserrat(
                                            color: HexColor('#262626'),
                                            fontWeight: FontWeight.w400),
                                      )),
                                    ],
                                    rows: List.generate(snapshot.data.length,
                                        (index) {
                                      final firstname =
                                          snapshot.data[index].firstname;
                                      final lastname =
                                          snapshot.data[index].lastname;
                                      final String? cnic =
                                          snapshot.data[index].cnic;
                                      final address =
                                          snapshot.data[index].address;
                                      final mobileno =
                                          snapshot.data[index].mobileno;
                                      final vechileno =
                                          snapshot.data[index].vechileno;
                                      final propertytype =
                                          snapshot.data[index].propertytype;
                                      final residenttype =
                                          snapshot.data[index].residenttype;

                                      return DataRow(
                                          color: (index % 2 != 0)
                                              ? MaterialStateProperty.all(
                                                  HexColor('#F3F3F3'))
                                              : MaterialStateProperty.all(
                                                  HexColor('#FDFDFD')),
                                          cells: [
                                            DataCell(Container(
                                                width: 75,
                                                child: Text(
                                                  firstname,
                                                  style: GoogleFonts.montserrat(
                                                      color:
                                                          HexColor('#000000'),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ))),
                                            DataCell(Container(
                                                child: Text(
                                              lastname,
                                              style: GoogleFonts.montserrat(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                            DataCell(Container(
                                                child: Text(
                                              cnic ?? 'NA',
                                              style: GoogleFonts.montserrat(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                            DataCell(Container(
                                                child: Text(
                                              address,
                                              style: GoogleFonts.montserrat(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                            DataCell(Container(
                                                child: Text(
                                              mobileno,
                                              style: GoogleFonts.montserrat(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                            DataCell(Container(
                                                child: CircleAvatar(
                                              backgroundImage: NetworkImage(Api
                                                      .imageBaseUrl +
                                                  snapshot.data[index].image),
                                            ))),
                                            DataCell(Container(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      print(
                                                          snapshot.data[index]);
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return Dialog(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              elevation: 0,
                                                              child: Container(
                                                                width: 636,
                                                                height: 562,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            40)),
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                        "Residental Details",
                                                                        style: GoogleFonts.montserrat(
                                                                            color: HexColor(
                                                                                '#262626'),
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w700)),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    child: SvgPicture.asset(
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
                    ));
                  } else {
                    return EmptyList(
                      name: 'No Residents',
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
