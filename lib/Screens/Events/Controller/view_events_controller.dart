import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../Model/Event.dart';

class ViewEventsController extends GetxController {
  var argument = Get.arguments;
  var subadminid;
  var bearerToken;
  List<Event> li = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('on init');
    subadminid = argument[0];
    bearerToken = argument[1];
    viewEvents(subadminid, bearerToken);
  }

  viewEvents(int subadminiid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.viewallevents + "/" + subadminiid.toString()),
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
            (e) => Event(
              id: e['id'],
              userid: e['userid'],
              title: e['title'],
              description: e['description'],
              startdate: e['startdate'],
              enddate: e['enddate'],
              active: e['active'],
            ),
          )
          .toList();

      return li;
    }
    return li;
  }
}
