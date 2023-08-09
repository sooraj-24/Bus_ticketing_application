import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:buts/Features/SignIn/Controller/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../VerifyEmail/View/verify_otp_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, controller, child){
        return Scaffold(
          backgroundColor: kAccentBlue,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      height: MediaQuery.of(context).size.height*0.27,
                      alignment: const Alignment(0,-0.5),
                      decoration: const BoxDecoration(
                          color: kDarkBlue,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
                      ),
                      child: SafeArea(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Hi',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontSize: 30
                                  ),
                                ),
                                Text(
                                  '${controller.user.data?.name}!',
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 175,
                      left: 20,
                      right: 20,
                      bottom: 325,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(-4, -4), // changes position of shadow
                              ),
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 0,

                                blurRadius: 10,
                                offset: const Offset(4, 4), // changes position of shadow
                              ),
                            ]
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Profile Information',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Divider(thickness: 1,),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Roll Number',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54
                                    ),
                                  ),
                                  Text(
                                    '${controller.user.data?.rollno?.toUpperCase()}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Username',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54
                                    ),
                                  ),
                                  Text(
                                    '${controller.user.data?.name}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54
                                    ),
                                  ),
                                  Text(
                                    '${controller.user.data?.email}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Password',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      try {
                                        await Provider.of<SignInProvider>(context, listen: false).forgotPasswordSendOTP(controller.user.data!.rollno!);
                                        if(Provider.of<SignInProvider>(context, listen: false).otpSent){
                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return VerifyOtpScreen(isForgotPasswordScreen: true,);
                                          }));
                                        }
                                      } catch(e) {
                                        Flushbar(
                                          message: e.toString(),
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 28.0,
                                            color: Colors.blue[300],
                                          ),
                                          duration: const Duration(seconds: 2),
                                          leftBarIndicatorColor: Colors.blue[300],
                                          flushbarPosition: FlushbarPosition.TOP,
                                        ).show(context);
                                      }
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: kAccentBlue,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Provider.of<SignInProvider>(context).state == ViewState.Busy
                                          ? Center(
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(color: kBlue, strokeWidth: 2,),
                                        ),
                                      )
                                          : Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Edit',
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 14
                                            ),
                                          ),
                                          Icon(Icons.edit, size: 13, color: kBlue,)
                                        ],
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
                  ],
                ),
              ),
              const Text(
                'Copyright © 2023 UniGo Inc.\nAll rights reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: kGrey
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){},
                    child: Ink(
                      height: 50,
                      decoration: const BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Center(child: Text('Sign Out',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

