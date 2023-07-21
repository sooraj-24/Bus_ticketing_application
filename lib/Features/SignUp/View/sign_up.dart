import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Home/View/home.dart';
import 'package:buts/Features/SignUp/Controller/sign_up_provider.dart';
import 'package:buts/Features/VerifyEmail/Controller/verify_email_provider.dart';
import 'package:buts/Features/VerifyEmail/View/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: kYellow,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Column(
                children: [

                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
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
                          const Expanded(child: SizedBox()),
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Create an account for the email, ${Provider.of<VerifyEmailProvider>(context).getEmail}@iiitdmj.ac.in",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  Consumer<SignUpProvider>(
                    builder: (context,controller,child){
                      return Expanded(
                        flex: 3,
                        child: Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: kAccentBlue,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    child: Center(
                                      child: TextFormField(
                                        onSaved: (value){
                                          controller.updateRollNo(value!);
                                        },
                                        validator: (value){
                                          if (value == null || value == '') {
                                            controller.updateRollNoError(true);
                                            controller.updateRollNoErrorText('Enter your Roll Number');
                                          } else {
                                            controller.updateRollNoError(false);
                                            controller.updateRollNoErrorText('');
                                          }
                                          return null;
                                        },
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                        ],
                                        textInputAction: TextInputAction.done,
                                        decoration: const InputDecoration(
                                            hintText: "Roll Number",
                                            hintStyle: TextStyle(fontSize: 15),
                                            prefixIcon: Icon(
                                              Icons.vpn_key,
                                              color: kGrey,
                                            ),
                                            border: InputBorder.none,
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 15)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: controller.getRollNoError
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 14),
                                    child: Text(
                                      controller.getRollNoErrorText,
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
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: kAccentBlue,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    child: Center(
                                      child: TextFormField(
                                        onSaved: (value) {
                                          controller.updateUsername(value!);
                                        },
                                        validator: (value) {
                                          if (value == null || value == '') {
                                            controller.updateUsernameError(true);
                                            controller.updateUsernameErrorText('Enter Username');
                                          } else {
                                            controller.updateUsernameError(false);
                                            controller.updateUsernameErrorText('');
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.done,
                                        decoration: const InputDecoration(
                                            hintText: "Username",
                                            hintStyle: TextStyle(fontSize: 15),
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: kGrey,
                                            ),
                                            border: InputBorder.none,
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 15)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: controller.getUsernameError
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 14),
                                    child: Text(
                                      controller.getUsernameErrorText,
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
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: kAccentBlue,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: kAccentBlue,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                                const Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Text(
                                        'By registering, you are agreeing to our Terms of Use and Privacy Policy.',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      final isValid = formKey.currentState?.validate();
                                      if(!controller.getConfirmPassError && !controller.getPasswordError && !controller.getRollNoError && !controller.getUsernameError){
                                        formKey.currentState?.save();
                                        try{
                                          await controller.registerUser(Provider.of<VerifyEmailProvider>(context, listen: false).token);
                                          if(controller.user.message == "Registered Successfully!"){
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              return HomePage(token: controller.user.data!.token!,);
                                            }));
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
                                            child: CircularProgressIndicator(color: kWhite,strokeWidth: 3,)) : Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Already have an account?  "),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context){return const VerifyEmailScreen();}));
                                        },
                                        child: const Text(
                                          "Sign In",
                                          style:
                                          TextStyle(fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
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
