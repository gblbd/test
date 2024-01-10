
import 'dart:convert';

import 'package:coding_test/Model/AllCity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Api/BaseClient.dart';
import '../Model/CityData.dart';

class SelectCityController extends GetxController{

  RxList<Datum> items = RxList<Datum>();
  RxList<Datum> filteredList = <Datum>[].obs;

  @override
  void onInit() {
    //fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {

    var response;
    response = await BaseClient()
        .get('thako/public/district/get-all')
        .catchError((err) {
      debugPrint('error: $err');
    });

    if (response == null) {
      debugPrint('failed to get response');
      return;
    }
    var res = json.decode(response);
    //debugPrint('successful: $response');

    AllCity allDatum = AllCityFromJson(response);

    if (allDatum.status == true) {
      items.value = allDatum.data!;
      filteredList.assignAll(items);
      print(allDatum.message);

    }
  }

  void filterList(String searchText) {
    if (searchText.isEmpty) {
      filteredList.assignAll(items);
    } else {
      filteredList.assignAll(items
          .where((item) =>
          item.districtName!
              .toLowerCase().toString()
              .contains(searchText.toLowerCase())));

      print(filteredList.value.toString());
    }
  }

  @override
  void onClose() {
    // Dispose of resources, subscriptions, etc.
    super.onClose();
  }

}