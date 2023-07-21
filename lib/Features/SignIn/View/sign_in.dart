import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Features/Home/View/home.dart';
import 'package:buts/Features/SignIn/Controller/sign_in_provider.dart';
import 'package:buts/Features/VerifyEmail/Controller/verify_email_provider.dart';
import 'package:buts/Features/VerifyEmail/View/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:buts/Constants/constants.dart';
import 'package:provider/provider.dart';

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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "BuTS",
                              style: TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Your daily ride companion.",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
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
                                          child: Text('Forgot Password?')
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(
                                              token: controller.user.data!.token!,
                                            )));
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
                  // Consumer<SignInProvider>(
                  //   builder: (context, controller, child){
                  //     return Expanded(
                  //         flex: 3,
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 30, vertical: 30),
                  //           decoration: BoxDecoration(
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.grey.withOpacity(0.5),
                  //                   spreadRadius: 0,
                  //                   blurRadius: 10,
                  //                   offset: const Offset(
                  //                       0, 4), // changes position of shadow
                  //                 ),
                  //               ],
                  //               color: kYellow,
                  //               borderRadius: const BorderRadius.only(
                  //                   topRight: Radius.circular(30),
                  //                   topLeft: Radius.circular(30))),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.stretch,
                  //             children: [
                  //               const Expanded(
                  //                   flex: 2,
                  //                   child: Padding(
                  //                     padding: EdgeInsets.only(top: 8, left: 5),
                  //                     child: Text(
                  //                       "Sign In",
                  //                       style: TextStyle(
                  //                           fontSize: 24,
                  //                           fontWeight: FontWeight.bold),
                  //                     ),
                  //                   )),
                  //               Expanded(
                  //                 flex: 2,
                  //                 child: Container(
                  //                   decoration: const BoxDecoration(
                  //                       color: kAccentBlue,
                  //                       borderRadius:
                  //                       BorderRadius.all(Radius.circular(20))),
                  //                   child: Center(
                  //                     child: TextFormField(
                  //                       onChanged: (value) {
                  //                         controller.updateEmail(value);
                  //                       },
                  //                       keyboardType: TextInputType.emailAddress,
                  //                       textInputAction: TextInputAction.done,
                  //                       decoration: const InputDecoration(
                  //                           hintText: "Email",
                  //                           hintStyle: TextStyle(fontSize: 15),
                  //                           prefixIcon: Icon(
                  //                             Icons.mail,
                  //                             color: kGrey,
                  //                           ),
                  //                           border: InputBorder.none,
                  //                           contentPadding:
                  //                           EdgeInsets.symmetric(vertical: 15)),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               const SizedBox(
                  //                 height: 15,
                  //               ),
                  //               Expanded(
                  //                 flex: 2,
                  //                 child: Container(
                  //                   decoration: const BoxDecoration(
                  //                       color: kAccentBlue,
                  //                       borderRadius:
                  //                       BorderRadius.all(Radius.circular(20))),
                  //                   child: Center(
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.only(right: 5),
                  //                       child: TextField(
                  //                         onChanged: (value) {
                  //                           controller.updatePassword(value);
                  //                         },
                  //                         enabled: controller.getUserExists,
                  //                         obscureText: !controller.getIsPasswordVisible,
                  //                         keyboardType: TextInputType.emailAddress,
                  //                         textInputAction: TextInputAction.done,
                  //                         decoration: InputDecoration(
                  //                             hintText: "Password",
                  //                             hintStyle:
                  //                             const TextStyle(fontSize: 15),
                  //                             prefixIcon: const Icon(
                  //                               Icons.password,
                  //                               color: Colors.grey,
                  //                             ),
                  //                             suffixIcon: controller.getUserExists
                  //                                 ? controller.getPassword
                  //                                 .isEmpty
                  //                                 ? null
                  //                                 : IconButton(
                  //                               color: Colors.grey,
                  //                               icon: Icon(!controller.getIsPasswordVisible
                  //                                   ? Icons.visibility
                  //                                   : Icons
                  //                                   .visibility_off),
                  //                               onPressed: () {
                  //                                 controller.togglePasswordVisibility();
                  //                               },
                  //                             )
                  //                                 : const Icon(
                  //                               Icons.lock,
                  //                               size: 20,
                  //                             ),
                  //                             border: InputBorder.none,
                  //                             contentPadding: const EdgeInsets.symmetric(vertical: 15)),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               //SizedBox(height: 5,),
                  //               Expanded(
                  //                   flex: 1,
                  //                   child: Column(
                  //                     mainAxisAlignment: MainAxisAlignment.center,
                  //                     crossAxisAlignment: CrossAxisAlignment.end,
                  //                     children: const [
                  //                       Text(
                  //                         "Forgot Password?",
                  //                       ),
                  //                     ],
                  //                   )),
                  //               const SizedBox(
                  //                 height: 15,
                  //               ),
                  //               Expanded(
                  //                 flex: 2,
                  //                 child: Container(
                  //                   decoration: const BoxDecoration(
                  //                     color: kBlue,
                  //                     borderRadius:
                  //                     BorderRadius.all((Radius.circular(20))),
                  //                   ),
                  //                   child: Center(
                  //                     child: Text(
                  //                       controller.getUserExists ? 'Sign In' : 'Verify Email',
                  //                       style: const TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: Colors.white,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               const SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Expanded(
                  //                   flex: 1,
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.center,
                  //                     children: [
                  //                       const Text("Don't have an account?  "),
                  //                       GestureDetector(
                  //                         onTap: () {
                  //                           Navigator.push(context,
                  //                               MaterialPageRoute(
                  //                                   builder: (context) {
                  //                                     return const SignUpScreen();
                  //                                   }));
                  //                         },
                  //                         child: const Text(
                  //                           "Sign Up",
                  //                           style: TextStyle(
                  //                               fontWeight: FontWeight.w600),
                  //                         ),
                  //                       )
                  //                     ],
                  //                   )),
                  //             ],
                  //           ),
                  //         ));
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
