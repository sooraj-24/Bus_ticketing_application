import 'package:buts/Features/BookTicket/View/confirm_booking.dart';
import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:buts/Features/Home/View/home.dart';
import 'package:buts/Features/MyBookings/Controller/bookings_provider.dart';
import 'package:buts/Features/MyBookings/View/my_bookings_page.dart';
import 'package:buts/Features/Queue/Controller/queue_provider.dart';
import 'package:buts/Features/Queue/View/queue_screen.dart';
import 'package:buts/Features/SignIn/Controller/sign_in_provider.dart';
import 'package:buts/Features/SignUp/Controller/sign_up_provider.dart';
import 'package:buts/Features/Splash/View/splash_screen.dart';
import 'package:buts/Features/VerifyEmail/Controller/verify_email_provider.dart';
import 'package:buts/Features/VerifyEmail/View/verify_email_screen.dart';
import 'package:buts/Features/VerifyEmail/View/verify_otp_screen.dart';
import 'package:buts/Features/Wallet/View/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:buts/Features/SignIn/View/sign_in.dart';
import 'package:buts/Features/SignUp/View/sign_up.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VerifyEmailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QueueProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BuTS',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: VerifyEmailScreen(),
      ),
    );
  }
}
