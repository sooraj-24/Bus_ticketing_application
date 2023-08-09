import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Home/View/home.dart';
import 'package:buts/Features/MyBookings/Controller/bookings_provider.dart';
import 'package:buts/Features/SignIn/View/sign_in.dart';
import 'package:buts/Features/VerifyEmail/View/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Home/Controller/home_page_provider.dart';
import '../../SignIn/Model/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _navigateToHome();
  }

  _navigateToHome() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userData = sp.getString('user');
    if(userData == null || userData.isEmpty){
      await Future.delayed(Duration(milliseconds: 1500));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return VerifyEmailScreen();
      }));
    } else {
      UserModel user = userModelFromJson(userData);
      http.Response response;
      var url = Uri.parse("https://buts-server.onrender.com/user/bookings");
      try {
        response = await http.get(url, headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${user.data?.token}"
        }).catchError((e){
          throw Exception(e.toString());
        });
        if(response.statusCode == 200){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return HomePage(user: user);
          }));
        } else {
          throw Exception();
        }
      } catch(e) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return VerifyEmailScreen();
        }));
      }
    }
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _isVisible = !_isVisible;
        _startAnimation();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kYellow,
      body: Center(
        child: TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 1000),
          tween: Tween(begin: _isVisible ? 0.3 : 1.0, end: _isVisible ? 1.0 : 0.3),
          builder: (BuildContext context, double opacity, Widget? child){
            return AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 200),
              child: Image.asset(
                'assets/images/Icon.png',
                width: 150,height: 150,
              ),
            );
          },
        ),
      ),
    );
  }
}
