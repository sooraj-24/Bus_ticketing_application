import 'package:buts/Processing/constants.dart';
import 'package:flutter/material.dart';
import 'package:buts/Screens/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = '';
  String username = '';
  String password = '';
  String emailErrorText = '';
  String passwordErrorText = '';
  String usernameErrorText = '';
  bool usernameError = false;
  bool passwordError = false;
  bool emailError = false;
  bool isInstituteEmail = true;
  bool confirmPassError = false;
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
          physics: NeverScrollableScrollPhysics(),
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
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sign Up with your Institute Email and start booking tickets.',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      decoration: BoxDecoration(
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
                                decoration: BoxDecoration(
                                    color: kAccentBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: TextFormField(
                                    onSaved: (value){
                                      email = value!;
                                    },
                                    validator: (value) {
                                      final regExp = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                      if (value == null || value == '') {
                                        setState(() {
                                          emailError = true;
                                          emailErrorText = 'Enter an Email';
                                        });
                                      } else if (!regExp.hasMatch(value)) {
                                        setState(() {
                                          emailError = true;
                                          emailErrorText =
                                              'Enter a valid Email';
                                        });
                                      } else {
                                        setState(() {
                                          emailError = false;
                                          if (value != null &&
                                              value
                                                  .contains('@iiitdmj.ac.in')) {
                                            isInstituteEmail = true;
                                          } else {
                                            isInstituteEmail = false;
                                            emailErrorText =
                                                'Enter Institute Email only';
                                          }
                                        });
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(fontSize: 15),
                                        prefixIcon: Icon(
                                          Icons.mail,
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
                              child: emailError
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 14),
                                      child: Text(
                                        emailErrorText,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  : (isInstituteEmail
                                      ? null
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 14),
                                          child: Text(
                                            emailErrorText,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kAccentBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: TextFormField(
                                    onSaved: (value) {
                                      username = value!;
                                    },
                                    validator: (value) {
                                      setState(() {
                                        if (value == null || value == '') {
                                          usernameError = true;
                                          usernameErrorText =
                                              'Enter a username';
                                        } else {
                                          usernameError = false;
                                          usernameErrorText = '';
                                        }
                                      });
                                    },
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
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
                              child: usernameError
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 14),
                                      child: Text(
                                        usernameErrorText,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kAccentBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: TextFormField(
                                      onSaved: (value){
                                        password = value!;
                                      },
                                      onChanged: (value) {
                                        password = value;
                                      },
                                      validator: (value) {
                                        if(value == null || value == ''){
                                          setState(() {
                                            passwordError = true;
                                            passwordErrorText = 'Enter your password';
                                          });
                                        } else if (value.length < 7) {
                                          setState(() {
                                            passwordError = true;
                                            passwordErrorText = 'Password length must be greater than 7';
                                          });
                                        } else {
                                          setState(() {
                                            passwordError = false;
                                            passwordErrorText = '';
                                          });
                                        }
                                      },
                                      obscureText: true,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
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
                              child: passwordError
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 14),
                                      child: Text(
                                        passwordErrorText,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kAccentBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: TextFormField(
                                      onSaved: (value) {
                                        password = value!;
                                      },
                                      validator: (value){
                                        setState(() {
                                          if(value != null && value != password){
                                            confirmPassError = true;
                                          } else {
                                            confirmPassError = false;
                                          }
                                        });
                                      },
                                      obscureText: true,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
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
                              child: confirmPassError
                                  ? Padding(
                                padding: const EdgeInsets.only(
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
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
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
                                onTap: () {
                                  final isValid = formKey.currentState?.validate();
                                  if(!confirmPassError && !passwordError && !emailError && !usernameError){
                                    formKey.currentState?.save();
                                  }
                                  print(email + username + password);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kBlue,
                                    borderRadius:
                                        BorderRadius.all((Radius.circular(20))),
                                  ),
                                  child: Center(
                                    child: Text(
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
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account?  "),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){return SignInScreen();}));
                                    },
                                    child: Text(
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
