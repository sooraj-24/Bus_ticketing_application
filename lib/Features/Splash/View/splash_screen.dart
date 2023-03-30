import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/SignIn/View/sign_in.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return SignInScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Text(
          'BuTS',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
