import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazreminderapp/Views/Auth/verificationcode.dart';
import 'package:namazreminderapp/Widget/Textfield.dart';

import '../../Utils/colors.dart';
import '../../Utils/images.dart';
import 'Login.dart';

class FortgotPasswordScreen extends StatefulWidget {
  const FortgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<FortgotPasswordScreen> createState() => _FortgotPasswordScreenState();
}

class _FortgotPasswordScreenState extends State<FortgotPasswordScreen> {
  var emailText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 500,
                width: 400,
                decoration: BoxDecoration(
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
                        height: 200,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes the position of the shadow
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
                                "Forgot Password",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold,color: AppColor.kPurpleColor),
                              ),
                              Container(
                                height: 30,
                              ),

                              Container(
                                height: 45,
                                child: MyTextField(
                                  controller: emailText,
                                  // icon: Icons.email_outlined,
                                  hintText: "Enter Email",
                                ),
                              ),
                             Container(height: 11,),
                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.kPurpleColor,
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),),),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerificationCodeScreen()),
                                      );
                                    },
                                    child: Text("Send Code")),
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
                                  LoginScreen()),
                        );
                      },
                      child: Container(
                          padding: EdgeInsets.only(left: 100),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Remember Now? ',
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                                TextSpan(
                                  text: 'Login Now',
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
    );
  }
}
