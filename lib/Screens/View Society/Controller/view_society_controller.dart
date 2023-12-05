import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import '../Model/Society.dart';

class ViewSocietyController extends GetxController {
  late Future data;
  TextEditingController searchController = TextEditingController();
  var userdata = Get.arguments;
  late final User user;
  late final Society society;
  String? query;
  Timer? debouncer;
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
      update();
    }

    debouncer = Timer(duration, callback);
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debouncer?.cancel();
  }

  @override
  void onInit() async {
    super.onInit();
    this.user = userdata;

    data = viewAllSocietiesApi(user.id!, user.bearerToken!);
    update();
  }

  Future viewAllSocietiesApi(int id, String token) async {
    print(id.toString());
    print(token);

    var societyli = <Society>[].obs;

    final response = await Http.get(
      Uri.parse(Api.view_all_societies + "/" + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    if (response.statusCode == 200) {
      for (var e in mydata) {
        final Society society = Society(
            id: e['id'],
            name: e['name'],
            address: e['address'],
            city: e['city'],
            country: e['country'],
            state: e['state'],
            type: e['type']);

        societyli.add(society);
      }
      print(societyli.length);
      print(societyli);
      update();

      return societyli;
    } else {}
  }

  Future searchSocietyApi(String? query, String token) async {
    print('iam inside the search society');
    print(query);
    print(token);

    if (query == "#") {
      query = " ";
    }
    var societyli = <Society>[].obs;

    final response = await Http.get(
      Uri.parse(Api.search_society + "/" + query!),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    if (response.statusCode == 200) {
      for (var e in mydata) {
        final Society society = Society(
            id: e['id'],
            name: e['name'],
            address: e['address'],
            city: e['city'],
            country: e['country'],
            state: e['state'],
            type: e['type']);

        societyli.add(society);
      }
      update();

      return societyli;
    } else {
      update();
      return societyli;
    }
  }

  Future deleteSocietyApi(int societyid, String token) async {
    print(societyid.toString());
    print(token);

    final response = await Http.get(
      Uri.parse(Api.delete_society + "/" + societyid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      this.data = viewAllSocietiesApi(user.id!, user.bearerToken!);
      Get.back();
      update();
    } else {
      Get.snackbar("Failed to Load", "");
    }
  }
}
