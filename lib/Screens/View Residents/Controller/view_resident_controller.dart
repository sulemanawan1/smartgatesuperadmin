import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';


import '../../../Constants/api_routes.dart';
import 'package:http/http.dart' as Http;

import '../Model/Resident.dart';

class ViewResidentsController extends GetxController {
  var argument = Get.arguments;
  var subadminid;
  var bearerToken;
  List<Resident> li = [];
  

  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('on init');
    subadminid = argument[0];
    bearerToken = argument[1];
    viewResidentsApi(subadminid, bearerToken);

    
    
  }

  viewResidentsApi(int subadminiid, String token) async {
    

    final response = await Http.get(
      Uri.parse(Api.viewallresidents + "/" + subadminiid.toString()),
      // "?page=" +
      // pagesize.toString()),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    
    if (response.statusCode == 200) {

      li = await (data['residentslist'] as List)
          .map(
            (e) => Resident(
                firstname: e['firstname'],
                image: e['image'],
                password: e['password'],
                id: e['id'],
                address: e['address'],
                committeemember: e["committeemember"],
                cnic: e['cnic'],
                lastname: e['lastname'],
                mobileno: e['mobileno'],
                owneraddress: e['owneraddress'],
                ownermobileno: e['ownermobileno'],
                ownername: e['ownername'],
                propertytype: e['propertytype'],
                residentid: e['residentid'],
                residenttype: e['residenttype'],
                roleid: e['roleid'],
                rolename: e['rolename'],
                subadminid: e['subadminid'],
                vechileno: e['vechileno']),
          )
          .toList();

      return li;
    }
    return li;
  }


}
