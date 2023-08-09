import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Features/SignUp/View/sign_up.dart';
import 'package:buts/Features/VerifyEmail/Controller/verify_email_provider.dart';
import 'package:buts/Features/VerifyEmail/View/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../Constants/constants.dart';

//ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();

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
                              'Reset Password',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
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
                                'Enter your new password',
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: kAccentBlue,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: TextFormField(
                                          onSaved: (value){
                                            controller.updatePassword(value!);
                                          },
                                          onChanged: (value) {
                                            controller.updatePassword(value);
                                          },
                                          validator: (value) {
                                            if(value == null || value == ''){
                                              controller.updatePasswordError(true);
                                              controller.updatePasswordErrorText('Enter your password');
                                            } else if (value.length < 7) {
                                              controller.updatePasswordError(true);
                                              controller.updatePasswordErrorText('Password length should be greater than 7');
                                            } else {
                                              controller.updatePasswordError(false);
                                              controller.updatePasswordErrorText('');
                                            }
                                            return null;
                                          },
                                          obscureText: true,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                              hintText: "Password",
                                              hintStyle: TextStyle(fontSize: 15),
                                              prefixIcon: Icon(
                                                Icons.password,
                                                color: Colors.grey,
                                              ),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: controller.getPasswordError
                                        ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 14),
                                      child: Text(
                                        controller.getPasswordErrorText,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                        : null,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: kAccentBlue,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: TextFormField(
                                          onSaved: (value) {
                                            controller.updatePassword(value!);
                                          },
                                          validator: (value){
                                            if(value != null && value != controller.getPassword){
                                              controller.updateConfirmPassError(true);
                                            } else {
                                              controller.updateConfirmPassError(false);
                                            }
                                            return null;
                                          },
                                          obscureText: true,
                                          keyboardType: TextInputType.emailAddress,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                              hintText: "Confirm Password",
                                              hintStyle: TextStyle(fontSize: 15),
                                              prefixIcon: Icon(
                                                Icons.password,
                                                color: Colors.grey,
                                              ),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: controller.getConfirmPassError
                                        ? const Padding(
                                      padding: EdgeInsets.only(
                                          top: 5, left: 14),
                                      child: Text('Passwords do not match',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  final isValid = formKey.currentState?.validate();
                                  if(!controller.getConfirmPassError && !controller.getPasswordError){
                                    try {
                                      await controller.resetPass();
                                      if(controller.passwordReset){
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(builder: (BuildContext context) => VerifyEmailScreen()),
                                            ModalRoute.withName('/')
                                        );
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
