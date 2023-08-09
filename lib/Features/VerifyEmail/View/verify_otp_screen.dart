import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Features/SignUp/View/sign_up.dart';
import 'package:buts/Features/VerifyEmail/Controller/verify_email_provider.dart';
import 'package:buts/Features/VerifyEmail/View/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../Constants/constants.dart';

//ignore: must_be_immutable
class VerifyOtpScreen extends StatelessWidget {
  String otp = "";
  final bool isForgotPasswordScreen;
  VerifyOtpScreen({super.key, required this.isForgotPasswordScreen});

  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyEmailProvider>(
      builder: (context, controller, child){
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            backgroundColor: kYellow,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30,top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(child: Container()),
                            const Text(
                              'OTP verification',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Enter the verification code we sent to ${controller.getEmail}@iiitdmj.ac.in',
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Enter OTP:',
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              ),
                            ),
                            Pinput(
                              length: 4,
                              showCursor: true,
                              onChanged: (value){
                                otp = value;
                              },
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Resend OTP',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  if(otp.isEmpty || otp.length < 4){
                                    Flushbar(
                                      message: "Please enter OTP",
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
                                      if(isForgotPasswordScreen){
                                        await controller.verifyForgotPassOTP(otp);
                                        if(controller.isOtpVerified){
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                            return ResetPasswordScreen();
                                          }));
                                        }
                                      } else {
                                        await controller.verifyOtp(otp);
                                        if(controller.isOtpVerified){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                                        }
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
                                  }
                                },
                                child: Ink(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: kBlue,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Center(
                                    child: controller.state == ViewState.Busy ? const SizedBox(
                                        height:18,
                                        width: 18,
                                        child: CircularProgressIndicator(color: kWhite,strokeWidth: 3,)) : const Text(
                                      'Submit',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
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
          ),
        );
      },
    );
  }
}
