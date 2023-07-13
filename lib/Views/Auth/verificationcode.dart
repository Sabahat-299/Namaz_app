import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:namazreminderapp/Views/Auth/resetPassword.dart';

import '../../Utils/colors.dart';
import '../../Utils/images.dart';
import 'Login.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
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
                  top: MediaQuery.of(context).size.height * 0.48,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 200,
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
                              const Text(
                                "Verification Code",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold,color: AppColor.kPurpleColor),
                              ),
                              Container(
                                height: 30,
                              ),
                              PinCodeFields(
                                length: 4,
                                fieldBorderStyle: FieldBorderStyle.square,
                                responsive: false,
                                fieldHeight:40.0,
                                fieldWidth: 40.0,
                                borderWidth:1.0,
                                activeBorderColor: Colors.pink,
                                activeBackgroundColor: Colors.pink.shade100,
                                borderRadius: BorderRadius.circular(10.0),
                                keyboardType: TextInputType.number,
                                autoHideKeyboard: false,
                                fieldBackgroundColor: Colors.black12,
                                borderColor: Colors.black38,
                                textStyle: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                onComplete: (output) {
                                  // Your logic with pin code
                                  if (kDebugMode) {
                                    print(output);
                                  }
                                },
                              ),

                              Container(
                                height: 12,
                              ),

                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.kPurpleColor,
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),),),
                                    onPressed: (

                                        ) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPasswordScreen()),
                                      );

                                    },
                                    child: const Text("Change Password")),
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
                                  const LoginScreen()),
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.only(left: 100),
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
