import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:namazreminderapp/Views/Auth/resetPassword.dart';
import 'package:namazreminderapp/Views/Auth/verificationcode.dart';
import 'package:namazreminderapp/Widget/Textfield.dart';
import 'package:provider/provider.dart';

import '../../Provider/Authprovider.dart';
import '../../Utils/colors.dart';
import '../../Utils/images.dart';
import '../../Widget/app_elevated_button.dart';
import 'Login.dart';

class FortgotPasswordScreen extends StatefulWidget {
  const FortgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<FortgotPasswordScreen> createState() => _FortgotPasswordScreenState();
}
final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  return emailRegex.hasMatch(email);
}
class _FortgotPasswordScreenState extends State<FortgotPasswordScreen> {
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
                  top: MediaQuery.of(context).size.height * 0.44,
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
                          child: Form(
                            key: formKey3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,color: AppColor.kPurpleColor),
                                ),
                                Container(
                                  height: 25,
                                ),

                                Container(
                                    height: 60,
                                    child: Consumer<AuthProvider>(builder: (context , authProvider, child){
                                      return MyTextField(
                                        obscureText: false,
                                        hintText: "Enter Email",
                                        errorText: "",
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return "Please enter email";
                                          }
                                          if(!isValidEmail(value)){
                                            return "please enter a valid email ";
                                          }
                                          return null;
                                        },
                                        controller: authProvider.forgotPasswordText,
                                        preffixIcon: const Icon(Icons.email_outlined,
                                          color: AppColor.kLightPurpleColor,
                                        ),
                                      );
                                    }) ),

                                AppElevatedButton(title: "Change Code",onPressed: (){
                                  if(formKey3.currentState!.validate()){
                                   Get.to(VerificationCodeScreen());
                                  }

                                },)
                              ],
                            ),
                          ),
                        )),
                  )),
              Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.015,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: (){
                        Get.back();
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
