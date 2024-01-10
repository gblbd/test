import 'package:coding_test/Constants/Constants.dart';
import 'package:coding_test/Model/Division.dart';
import 'package:coding_test/Pages/SelectPage/SelectSearch.dart';
import 'package:coding_test/Util/Tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/CategoryController.dart';
import '../../Model/Category.dart';


  class SelectPage extends StatefulWidget {

    String city, area;
    SelectPage({super.key, required this.city, required this.area});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {

  String _mySelection = "Select from list";
  String _mySelection2 = "Select from list";
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.fetchData();
    categoryController.fetchDataSub();
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
          body: Container(
            margin: EdgeInsets.only(left: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/icons/ic_back.svg',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 5),
                        child: Text(
                            "Sofol",
                          style: TextStyle(
                            color: color3,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        )
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                      "Select City",
                    style: TextStyle(
                        color: color3,
                        fontSize: 16
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SelectSearch(type: 'Select City',)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: color4, // Set your desired background color
                      borderRadius: BorderRadius.circular(5), // Set border radius to 10
                    ),
                    padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          width: 20,
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            widget.city == ""? "select city" : widget.city,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 10, right: 15),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    "Select Area",
                    style: TextStyle(
                        color: color3,
                        fontSize: 16
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color4, // Set your desired background color
                    borderRadius: BorderRadius.circular(5), // Set border radius to 10
                  ),
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location.svg',
                        width: 20,
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          widget.area == ""? "select area" : widget.area,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 10, right: 15),
                ),

                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    "Select Main Categorys",
                    style: TextStyle(
                        color: color3,
                        fontSize: 16
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color4, // Set your desired background color
                    borderRadius: BorderRadius.circular(5), // Set border radius to 10
                  ),
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  margin: EdgeInsets.only(top: 10, right: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/devlopment.svg',
                        width: 20,
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 25,
                        width: Tools.getSize(0.8, context),
                        child: Obx(() => DropdownButton(
                            hint: Text(
                                _mySelection,
                              style: TextStyle(
                                fontSize: 12
                              ),
                            ),
                            isExpanded: true,
                            underline: Container(),
                            items: categoryController.items.map((cityOne){
                              return DropdownMenuItem(
                                child: Text(cityOne.name!),
                                value: cityOne.name,
                              );
                            }).toList(),
                            onChanged: (value){
                              print("Selected city is $value");
                              setState(() {
                                _mySelection = value.toString();
                              });

                            }
                        )
                      ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    "Select Sub Category",
                    style: TextStyle(
                        color: color3,
                        fontSize: 16
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color4, // Set your desired background color
                    borderRadius: BorderRadius.circular(5), // Set border radius to 10
                  ),
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  margin: EdgeInsets.only(top: 10, right: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/database.svg',
                        width: 20,
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 25,
                        width: Tools.getSize(0.8, context),
                        child: Obx(() => DropdownButton(
                            hint: Text(
                              _mySelection2,
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                            isExpanded: true,
                            underline: Container(),
                            items: categoryController.items2.map((cityOne){
                              return DropdownMenuItem(
                                child: Text(cityOne.name!),
                                value: cityOne.name,
                              );
                            }).toList(),
                            onChanged: (value){
                              print("Selected city is $value");
                              setState(() {
                                _mySelection2 = value.toString();
                              });

                            }
                        )
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.only(right: 15, bottom: 20),
                      color: color1,
                      child: Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [

                                SvgPicture.asset(
                                  'assets/icons/select.svg',
                                  width: 25,
                                  height: 25,
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
