
import 'dart:convert';

import 'package:coding_test/Api/Constants.dart';
import 'package:coding_test/Model/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Api/BaseClient.dart';

class CategoryController extends GetxController{

  RxList<Category> items = RxList<Category>();
  RxList<Category> items2 = RxList<Category>();

  Future<void> fetchData() async {

    var response;
    response = await BaseClient()
        .getDropDownData(Constants.CATEGORY_URL)
        .catchError((err) {
      debugPrint('error: $err');
    });

    if (response == null) {
      debugPrint('failed to get response');
      return;
    }
    var res = json.decode(response);
    //debugPrint('successful: $response');


    List<Category> allDatum = CategoryFromJson(response);

    items.value = allDatum;

    print(items.value[0].name.toString());

  }

  Future<void> fetchDataSub() async {

    var response;
    response = await BaseClient()
        .getDropDownData(Constants.SUB_CATEGORY_URL)
        .catchError((err) {
      debugPrint('error: $err');
    });

    if (response == null) {
      debugPrint('failed to get response');
      return;
    }
    var res = json.decode(response);
    //debugPrint('successful: $response');


    List<Category> allDatum = CategoryFromJson(response);

    items2.value = allDatum;

    print(items2.value[0].name.toString());

  }

}