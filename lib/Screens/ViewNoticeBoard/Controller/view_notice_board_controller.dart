import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../Model/noticeboard.dart';

class ViewNotioceBoardController extends GetxController {
  var argument = Get.arguments;
  var subadminid;
  var bearerToken;
  List<NoticeBoard> li = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('on init');
    subadminid = argument[0];
    bearerToken = argument[1];
    ViewNoticesApi(subadminid, bearerToken);
  }

  ViewNoticesApi(int subadminiid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.viewallnotices + "/" + subadminiid.toString()),
      // "?page=" +
      // pagesize.toString()),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      li = await (data['data'] as List)
          .map(
            (e) => NoticeBoard(
                id: e['id'],
                subadminid: e['subadminid'],
                noticetitle: e['noticetitle'],
                noticedetail: e['noticedetail'],
                startdate: e['startdate'],
                enddate: e['enddate'],
                starttime: e['starttime'],
                endtime: e['endtime'],
                status: e['status'],
                createdAt: e['created_at']),
          )
          .toList();

      return li;
    }
    return li;
  }
}
