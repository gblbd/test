
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Api/BaseClient.dart';
import '../Api/Constants.dart';
import '../Model/AllList.dart';
import '../Model/Content.dart';

class AllListController extends GetxController{

  RxList<Content> items = RxList<Content>();

  Future<void> fetchData() async {

    Map<String, dynamic> body = {
      'sorting': 'LATEST',
    };

    var response;
    response = await BaseClient()
        .getAllList(Constants.BASE_URL, "/api/v/1.0.0/sofol/public/advertisements/get-all", body)
        .catchError((err) {
      debugPrint('error: $err');
    });

    if (response == null) {
      debugPrint('failed to get response');
      return;
    }
    var res = json.decode(response);
    debugPrint('successful: $response');

    AllList allDatum = AllListFromJson(response);


    if (allDatum.empty == false) {
      items.value = allDatum.content!;
    }


  }

}