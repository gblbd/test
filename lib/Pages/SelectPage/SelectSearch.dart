import 'package:coding_test/Model/CityData.dart';
import 'package:coding_test/Pages/SelectPage/SelectPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/Constants.dart';
import '../../Controller/SelectCityController.dart';

class SelectSearch extends StatefulWidget {

  final String type;

  const SelectSearch({super.key, required this.type});

  @override
  State<SelectSearch> createState() => _SelectSearchState();
}

class _SelectSearchState extends State<SelectSearch> {

  final SelectCityController districtController = Get.put(SelectCityController());
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    districtController.fetchData();
    super.initState();

    searchController.addListener(() {
      districtController.filterList(searchController.text);
    });

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,

    ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [

            Container(
              margin: const EdgeInsets.only(top: 15, left: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop(true);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/ic_back.svg',
                      width: 25,
                      height: 25,
                    ),
                  ),

                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.type,
                        style: TextStyle(
                            color: color3,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      )
                  )
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 15, right: 15, bottom: 15),
              child: TextField(
                controller: searchController,
                cursorColor: const Color(0Xff634099),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        width: 0.5, color: Color(0Xff634099)),
                  ),
                  hintText: 'search',
                  prefixIcon: const Icon(
                      Icons.search,
                      size: 25.0, color: color3),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      size: 25.0,
                      color: color3,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),

            Container(
              color: color2,
              margin: EdgeInsets.only( left: 15, right: 15),
              height: 1,
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Obx(() =>ListView.builder(
                      itemCount: districtController.filteredList.length,
                      itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(
                            builder: (context)=> SelectPage(
                                city: districtController.filteredList[index].division!.divisionName.toString() ,
                                area: districtController.filteredList[index].districtName.toString()
                            )
                        ));
                      },
                        child: SingleItem(districtController.filteredList[index])
                    );
                  }),
                ),
              ),
            ),


            
          ],
        ),
      ),
    );
  }

  Container SingleItem(Datum item) {
    return Container(
      height: 40,
      child: Column(
        children: [

          Row(
            children: [

              SvgPicture.asset(
                'assets/icons/location.svg',
                width: 20,
                height: 20,
              ),

              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  item.districtName.toString(),
                  style: TextStyle(
                    color: color3,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            color: color2,
            height: 1,
          ),

        ],
      ),
    );
  }
}
