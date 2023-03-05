import 'package:flutter/material.dart';
import 'package:buts/Screens/sign_in.dart';
import 'package:buts/Screens/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: SignInScreen(),
    );
  }
}
