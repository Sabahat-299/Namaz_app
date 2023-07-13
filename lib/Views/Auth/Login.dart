import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:namazreminderapp/Views/Auth/createaccount.dart';
import 'package:namazreminderapp/Views/Auth/forgot.dart';
import 'package:namazreminderapp/Widget/Textfield.dart';

import '../../Utils/appstyle.dart';
import '../../Utils/colors.dart';
import '../../Utils/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailText = TextEditingController();
  var passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 500,
                width: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      AppColor.kLightPurpleColor,
                      AppColor.kPurpleColor
                    ], // Define the colors for the gradient
                    begin: Alignment
                        .topLeft, // Define the starting point of the gradient
                    end: Alignment
                        .bottomRight, // Define the ending point of the gradient
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Image(
                  height: 30,
                  width: 30,
                  image: AssetImage(AppImages.logo.toString()),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.44,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 320,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Login",
                                style: AppStyle.textStyleBold18,
                              ),
                              Container(
                                height: 30,
                              ),
                              Container(
                                height: 45,
                                child: MyTextField(
                                  hintText: "Enter Email",

                                  controller: emailText,
                                  suffixIcon: const Icon(Icons.email_outlined,
                                    color: AppColor.kLightPurpleColor,
                                  ),
                                )
                              ),
                              Container(
                                height: 12,
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: passwordText,
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                        Icons.lock_open_outlined,
                                        color: AppColor.kLightPurpleColor,
                                      ),
                                      hintText: "Password",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: AppColor.kLightPurpleColor,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color:
                                                  AppColor.kLightPurpleColor))),
                                ),
                              ),
                              Center(
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FortgotPasswordScreen()),
                                      );
                                    },
                                    child: const Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                        color: AppColor.kLightPurpleColor,
                                      ),
                                    )),
                              ),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.kPurpleColor,
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),),),
                                    onPressed: () {
                                      },
                                    child: const Text("Login")),
                              )
                            ],
                          ),
                        )),
                  )),
              Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.015,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) =>
                            const CreateAccount()),
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.only(left: 100),
                          child:RichText(
                            text: const TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Not have an Account? ',
                                  style: TextStyle(color: Colors.grey,fontSize: 12),
                                ),
                                TextSpan(
                                  text: 'Create Now',
                                  style:
                                  TextStyle(color: AppColor.kLightPurpleColor, fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )),
            ],
          ),
        ),
      ),
      //
    );
  }
}
