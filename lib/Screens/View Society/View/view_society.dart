import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/Loader/loader.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/view_society_controller.dart';

class ViewSociety extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: primaryColor,
              size: 33,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: secondaryColor,
          title: Text(
            'View Societies',
            style: GoogleFonts.montserrat(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: GetBuilder<ViewSocietyController>(
            init: ViewSocietyController(),
            builder: (controller) {
              return FutureBuilder(
                  future: controller.data,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 104, top: 55, right: 192),
                            child: TextField(
                              controller: controller.searchController,
                              onChanged: (value) => controller.debounce(
                                () async {
                                  controller.query = value.toString();

                                  controller.data = controller.searchSocietyApi(
                                      controller.query,
                                      controller.user.bearerToken!);

                                  if (controller.query == "") {
                                    controller.data =
                                        controller.viewAllSocietiesApi(
                                            controller.user.id!,
                                            controller.user.bearerToken!);
                                  }
                                },
                              ),
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: HexColor("F7F8FA"),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(),
                                hintText: 'Search Society',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.cancel),
                                  onPressed: () {
                                    controller.searchController.text = '';
                                    controller.data =
                                        controller.viewAllSocietiesApi(
                                            controller.user.id!,
                                            controller.user.bearerToken!);
                                  },
                                ),
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 104, top: 65),
                                child: Text(
                                  'Societies',
                                  style: GoogleFonts.montserrat(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 104, right: 192, top: 49),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: HexColor('#F7F8FA'),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          print(
                                              'address ${snapshot.data[index].address}');
                                          Get.toNamed(viewAdminDetails,
                                              arguments: [
                                                controller.user,
                                                snapshot.data[index].id,
                                                snapshot.data[index].name,
                                              ]);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 30),
                                          padding: EdgeInsets.only(bottom: 30),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                //                    <--- top side
                                                color: HexColor('#9C9C9C'),

                                                style: BorderStyle.solid,
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ListTile(
                                            leading: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.038,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.058,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        'images/societypic.png',
                                                      ),
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              Color.fromRGBO(
                                                                  254,
                                                                  153,
                                                                  0,
                                                                  0.2),
                                                              BlendMode.dst),
                                                      fit: BoxFit.fill)),
                                            ),
                                            title: Text(
                                              snapshot.data[index].name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Text(
                                              snapshot.data[index].address
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            trailing: MyButton(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.091,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.036,
                                                name: "Update",
                                                color: HexColor('#2BE09F'),
                                                maxLines: 1,
                                                onPressed: () {
                                                  Get.offAndToNamed(
                                                      updateSociety,
                                                      arguments: [
                                                        snapshot.data[index],
                                                        controller.user
                                                      ]);
                                                }),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Loader();
                    } else {
                      return Loader();
                    }
                  });
            }));
  }
}
