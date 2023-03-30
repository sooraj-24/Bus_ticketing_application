import 'package:buts/Features/VerifyEmail/Controller/verify_email_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../Constants/constants.dart';

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
                                          controller.updateEmail(value);
                                        },
                                        onFieldSubmitted: (value){
                                          controller.updateEmail(value);
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
                                    onTap: (){},
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: kBlue,
                                        borderRadius:
                                        BorderRadius.all((Radius.circular(20))),
                                      ),
                                      child: const Center(
                                        child: Text(
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
