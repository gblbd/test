import 'package:coding_test/Pages/Nav/NavigationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Constants/Constants.dart';
import '../../Util/Tools.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

  @override
  void initState() {

    super.initState();
    //navigateToHome();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animationController.forward(); // Start the animation in the forward direction
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation has completed, navigate to the next screen
        navigateToHome();
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,

    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Center(
                  child: FadeTransition(
                    opacity: _animation,
                    child: Image.asset(
                      'assets/images/nagalay_logo.png',
                      width: Tools.getSize(0.40, context),
                      height: Tools.getSize(0.40, context),
                      // color: Variables.primaryColor

                    ),
                  )
              ),
            ),
          ),

          Flexible(
              flex: 1,
              child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/ic_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void navigateToHome() async{

    await Future.delayed(const Duration(seconds: 2), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const NavigationPage()));

  }
}
