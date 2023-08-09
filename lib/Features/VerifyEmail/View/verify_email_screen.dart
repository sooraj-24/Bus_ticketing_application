import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Features/SignIn/View/sign_in.dart';
import 'package:buts/Features/VerifyEmail/Controller/verify_email_provider.dart';
import 'package:buts/Features/VerifyEmail/View/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../Constants/constants.dart';
import '../../SignUp/View/sign_up.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

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
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: Image.asset(
                          'assets/images/Logo1.png',
                          width: 100,
                          height: 100,
                        ),
                      )),
                  Consumer<VerifyEmailProvider>(
                    builder: (context,controller,child){
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Verify Email",
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.w500),
                                ),
                                Expanded(child: Container()),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    decoration: const BoxDecoration(
                                        color: kAccentBlue,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    child: Center(
                                      child: TextFormField(
                                        onChanged: (value) {
                                          controller.updateEmail(value.toLowerCase());
                                        },
                                        onFieldSubmitted: (value){
                                          controller.updateEmail(value.toLowerCase());
                                        },
                                        keyboardType: TextInputType.emailAddress,
                                        textInputAction: TextInputAction.done,
                                        decoration: const InputDecoration(
                                            hintText: "Email",
                                            suffixText: '@iiitdmj.ac.in',
                                            hintStyle: TextStyle(fontSize: 15),
                                            prefixIcon: Icon(
                                              Icons.mail,
                                              color: kGrey,
                                            ),
                                            border: InputBorder.none,
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 15)),
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      if(controller.getEmail.isEmpty){
                                        Flushbar(
                                          message: "Enter an Email",
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
                                          await controller.fetchData();
                                          if(controller.user.message == "Exists"){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                                          } else if(controller.user.message == "OTP sent successfully"){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtpScreen(
                                              isForgotPasswordScreen: false,
                                            )));
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
                                        borderRadius:
                                        BorderRadius.all((Radius.circular(20))),
                                      ),
                                      child: Center(
                                        child: controller.state == ViewState.Busy ? const SizedBox(
                                            height:18,
                                            width: 18,
                                            child: CircularProgressIndicator(color: kWhite,strokeWidth: 3,)) : const Text(
                                          'Submit',
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
                                const SizedBox(
                                  height: 10,
                                )
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
