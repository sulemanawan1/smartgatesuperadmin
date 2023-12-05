import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:miasuperadmin/Screens/View%20GateKeepers/Model/gate_keeper_model.dart';

import '../../../Constants/api_routes.dart';

class ViewGateKeeperController extends GetxController {
  var argument = Get.arguments;
  var subadminid;
  var bearerToken;
  List<Gatekeeper> li = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('on init');
    subadminid = argument[0];
    bearerToken = argument[1];
    viewgatekeepers(subadminid, bearerToken);
  }

  viewgatekeepers(int subadminiid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.view_gatekeepers + "/" + subadminiid.toString()),
      // "?page=" +
      // pagesize.toString()),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      li = await (data['gatekeeperlist'] as List)
          .map(
            (e) => Gatekeeper(
              id: e['id'],
              subadminid: e['subadminid'],
              gatekeeperid: e['gatekeeperid'],
              firstname: e['firstname'],
              lastname: e['lastname'],
              cnic: e['cnic'],
              gateno: e['gateno'],
              roleid: e['roleid'],
              rolename: e['rolename'],
              address: e['address'],
              mobileno: e['mobileno'],
              password: e['password'],
              image: e['image'],
            ),
          )
          .toList();

      return li;
    }
    return li;
  }
}
