import 'package:coding_test/Constants/Constants.dart';
import 'package:coding_test/Controller/AllListController.dart';
import 'package:coding_test/Model/Content.dart';
import 'package:coding_test/Pages/SelectPage/SelectPage.dart';
import 'package:coding_test/Util/Tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final AllListController allListController = Get.put(AllListController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allListController.fetchData();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,

    ));

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: Tools.getSize(0.5, context),
                        margin: EdgeInsets.only(left: 15),
                        child: Row(
                          children: [

                            SvgPicture.asset(
                              'assets/icons/location.svg',
                              width: 20,
                              height: 20,
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text(
                                "Coxs's Bazar",
                                style: TextStyle(
                                    color: color3,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [

                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            width: 20,
                            height: 20,
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 6),
                              child: Text(
                                "Coxs's Bazar",
                                style: TextStyle(
                                    color: color3,
                                  fontSize: 16
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 1, // Adjust the height as needed
                    width: Tools.getSize(1, context),
                    margin: EdgeInsets.only(top: 20, bottom: 8),
                    color: color2,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [

                          SvgPicture.asset(
                            'assets/icons/devlopment.svg',
                            width: 20,
                            height: 20,
                            color: color3,
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Text(
                              "Development",
                              style: TextStyle(
                                  color: color3
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 20, // Adjust the height as needed
                        width: 1,
                        color: color2,
                      ),
                      Row(
                        children: [

                          SvgPicture.asset(
                            'assets/icons/database.svg',
                            width: 25,
                            height: 25  ,
                            color: color3,
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 6),
                              child: Text(
                                "Database",
                                style: TextStyle(
                                    color: color3
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  ),

                  Container(
                    height: 1, // Adjust the height as needed
                    width: Tools.getSize(1, context),
                    margin: EdgeInsets.only(top: 8, bottom: 20),
                    color: color2,
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectPage(city: '',area: '')));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.only(left: 15, right: 15),
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
                                    "Select",
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

                  Container(
                    margin: EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "5 Results",
                          style: TextStyle(
                            fontSize: 14,
                            color: color3,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                    Container(
                      //color: color4,
                      decoration: BoxDecoration(
                        color: color4, // Set your desired background color
                        borderRadius: BorderRadius.circular(10), // Set border radius to 10
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: DropdownButton<String>(
                        value: 'Relevance', // Initially selected value
                        items: <String>['Relevance', 'Option 2', 'Option 3', 'Option 4']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle dropdown value change
                          print('Selected: $newValue');
                        },
                        underline: Container(),
                        icon: SvgPicture.asset(
                          'assets/icons/ic_down.svg',
                          width: 10,
                          height: 10,
                          color: color3,
                        ),
                        style: TextStyle(color: color3),
                      ),
                    ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            Expanded(
              child: Obx(()=>
                  ListView.builder(
                      itemCount: allListController.items.length,
                      itemBuilder: (context, index){
                        return SingleItem(allListController.items[index]);
                      })
              )
            ),

          ],
        ),

        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 40,
            width: Tools.getSize(0.7, context),
            margin: EdgeInsets.only(left: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(20),
              ),
            ),
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [

                        SvgPicture.asset(
                          'assets/icons/filter.svg',
                          width: 10,
                          height: 10,
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            "Filter",
                            style: TextStyle(
                                color: color1
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 20, // Adjust the height as needed
                      width: 1,
                      color: color2,
                    ),
                    Row(
                      children: [

                        SvgPicture.asset(
                          'assets/icons/map.svg',
                          width: 13,
                          height: 13,
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              "Map",
                              style: TextStyle(
                                  color: color1
                              ),
                            )
                        ),
                      ],
                    )
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }


  Card SingleItem(Content item){
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Container(
        height: 150,
        child: Row(
          children: [

            Container(
              width: Tools.getSize(0.3, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/sample.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          ),
                          color: Colors.white
                      ),
                      height: 20,
                      width: 20,
                      padding: EdgeInsets.all(2),

                      child: SvgPicture.asset(
                        'assets/icons/ic_heart.svg',
                        width: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                    ),

                    Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          ),
                          color: Colors.white
                      ),
                      height: 20,
                      width: 20,
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(4),

                      child: SvgPicture.asset(
                        'assets/icons/ic_share.svg',
                        width: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                    ),

                    Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          ),
                          color: Colors.white
                      ),
                      height: 20,
                      width: 20,
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(2),

                      child: SvgPicture.asset(
                        'assets/icons/ic_add.svg',
                        width: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(8),
                  ), // Set border radius to 10
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          item.title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: color4, // Set your desired background color
                              borderRadius: BorderRadius.circular(5), // Set border radius to 10
                            ),
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              item.primaryCategory.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            margin: EdgeInsets.only(right: 5),
                          ),

                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            width: 20,
                            height: 20,
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(
                                item.address!.district!.districtName!+", "+item.address!.division!.divisionName.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: color3,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Row(
                        children: [

                          SvgPicture.asset(
                            'assets/icons/ic_student.svg',
                            width: 20,
                            height: 20,
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 4, right: 5),
                            child: Text(
                              item.studentCapacity.toString(),
                              style: TextStyle(
                                color: color3,
                                fontSize: 16,
                              ),
                            ),
                          ),


                          SvgPicture.asset(
                            'assets/icons/ic_online.svg',
                            width: 20,
                            height: 20,
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Text(
                                "Online",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: color3,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),

                    Flexible(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Row(
                                children: [

                                  SvgPicture.asset(
                                    'assets/icons/ic_star.svg',
                                    width: 17,
                                    height: 17,
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left: 3, right: 5),
                                    child: Text(
                                      item.avgRating.toString(),
                                      style: TextStyle(
                                          color: color3,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),

                                  Text(
                                    "(5k)",
                                    style: TextStyle(
                                      color: color2,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),



                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(
                                  "\$"+item.price!.monthly.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: color3,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
