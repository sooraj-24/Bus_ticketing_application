import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Features/Home/View/home.dart';
import 'package:buts/Features/SignIn/Controller/sign_in_provider.dart';
import 'package:buts/Features/VerifyEmail/Controller/verify_email_provider.dart';
import 'package:buts/Features/VerifyEmail/View/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:buts/Constants/constants.dart';
import 'package:provider/provider.dart';

import '../../Home/Controller/home_page_provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentBlue,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: kAccentBlue,
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Image.asset(
                          'assets/images/Logo1.png',
                          width: 100,
                          height: 100,
                        ),
                      )),
                  Consumer<SignInProvider>(
                    builder: (context, controller, child) {
                      return Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                                color: kYellow,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.arrow_back_ios,size: 15,)),
                                const SizedBox(height: 10,),
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Enter your password to Sign In",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    decoration: const BoxDecoration(
                                        color: kAccentBlue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Center(
                                      child: TextField(
                                        onChanged: (value) {
                                          controller.updatePassword(value);
                                        },
                                        obscureText:
                                            !controller.getIsPasswordVisible,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle:
                                                const TextStyle(fontSize: 15),
                                            prefixIcon: const Icon(
                                              Icons.password,
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: controller
                                                    .getPassword.isEmpty
                                                ? null
                                                : IconButton(
                                                    color: Colors.grey,
                                                    icon: Icon(!controller
                                                            .getIsPasswordVisible
                                                        ? Icons.visibility
                                                        : Icons.visibility_off),
                                                    onPressed: () {
                                                      controller
                                                          .togglePasswordVisibility();
                                                    },
                                                  ),
                                            border: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 15)),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          try {
                                            await controller.forgotPasswordSendOTP(Provider.of<VerifyEmailProvider>(context,listen: false).getEmail);
                                            if(controller.otpSent){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtpScreen(
                                                isForgotPasswordScreen: true,
                                              )));
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
                                          child: const Text('Forgot Password?')
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      if(controller.getPassword.isEmpty || controller.getPassword.length < 6){
                                        Flushbar(
                                          message: "Password length should be more than 6",
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 28.0,
                                            color: Colors.blue[300],
                                          ),
                                          duration: const Duration(seconds: 2),
                                          leftBarIndicatorColor: Colors.blue[300],
                                          flushbarPosition: FlushbarPosition.TOP,
                                        ).show(context);
                                      } else {
                                        try {
                                          await controller.fetchData(
                                              Provider.of<VerifyEmailProvider>(context,listen: false).getUserEmail()
                                          );
                                          if(controller.user.message == "Logged in Successfully"){
                                            // Navigator.pushAndRemoveUntil(
                                            //     context,
                                            //     MaterialPageRoute(builder: (BuildContext context) => HomePage(user: controller.user)),
                                            //     ModalRoute.withName('/')
                                            // );
                                            Navigator.pop(context);
                                            Provider.of<HomePageProvider>(context,listen: false).user = controller.user;
                                            await Provider.of<HomePageProvider>(context,listen: false).storeData();
                                          } else {
                                            Flushbar(
                                              message: controller.user.message,
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
                                        } catch(e) {
                                          controller.updateState();
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
                                      }
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: kBlue,
                                        borderRadius: BorderRadius.all(
                                            (Radius.circular(20))),
                                      ),
                                      child: Center(
                                        child: controller.state == ViewState.Busy ? const SizedBox(
                                            height:18,
                                            width: 18,
                                            child: CircularProgressIndicator(color: kWhite,strokeWidth: 3,)) : const Text(
                                          'Sign In',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
