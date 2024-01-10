import 'package:coding_test/Pages/LandingPage/LandingPage.dart';
import 'package:coding_test/Pages/SelectPage/SelectPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/Constants.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int index = 0;
  late PageController _pageController;
  bool canClose = false;

  @override
  void initState() {

    index = 0;
    _pageController = PageController(initialPage: index);

    super.initState();
  }

  final screens = [
    const LandingPage(),
    SelectPage(city: "", area: "",),
  ];

  @override
  Widget build(BuildContext context) {

    print("build");

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0XffFDF9FF),
      statusBarIconBrightness: Brightness.dark,

    ));

    return WillPopScope(
      onWillPop: () async{
        if (index > 0) {

          _pageController.animateToPage(
            index - 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );

          return false;

        } else {
          return true;
        }
      },

      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: screens,
          onPageChanged: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 15.0,
                offset: const Offset(0, 4),
                color: kBlack.withOpacity(0.25),
              ),
            ],
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                    (Set<MaterialState> states) => states.contains(MaterialState.selected)
                    ? const TextStyle(color: color1)
                    : const TextStyle(color: color2),
              ),
            ),
            child: NavigationBar(
              height: 70,

              indicatorColor: const Color(0XffF5F5FF),
              backgroundColor: Colors.white,
              selectedIndex: index,
              //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              //animationDuration: const Duration(seconds: 1),
              onDestinationSelected: (newIndex) {
                setState(() {
                  index = newIndex;
                  _pageController.animateToPage(
                    newIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              destinations: [

                NavigationDestination(
                    selectedIcon: SizedBox(
                      width: 23,
                      height: 23,
                      child: SvgPicture.asset(
                        'assets/icons/explore.svg',
                        width: 15,
                        height: 15,
                        color: color1,
                      ),
                    ),
                    icon: SizedBox(
                      width: 23,
                      height: 23,
                      child: SvgPicture.asset(
                        'assets/icons/explore.svg',
                        width: 15,
                        height: 15,
                        color: color2,
                      ),
                    ),
                    label: 'Explore'
                ),

                NavigationDestination(
                    selectedIcon: SizedBox(
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset(
                        'assets/icons/request.svg',
                        width: 17,
                        height: 17,
                        color: color1,
                      ),
                    ),
                    icon: SizedBox(
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset(
                        'assets/icons/request.svg',
                        width: 17,
                        height: 17,
                      ),
                    ),
                    label: 'Request'),

                NavigationDestination(
                    selectedIcon: SizedBox(
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset(
                        'assets/icons/inbox.svg',
                        width: 17,
                        height: 17,
                        color: color1,
                      ),
                    ),
                    icon: SizedBox(
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset(
                        'assets/icons/inbox.svg',
                        width: 17,
                        height: 17,
                      ),
                    ),
                    label: 'Inbox'
                ),

                NavigationDestination(
                    selectedIcon: SizedBox(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'assets/icons/trips.svg',
                        width: 20,
                        height: 20,
                        color: color1,
                      ),
                    ),
                    icon: SizedBox(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        'assets/icons/trips.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    label: 'Trips'),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
