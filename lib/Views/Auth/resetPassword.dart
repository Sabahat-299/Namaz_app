import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../Provider/Authprovider.dart';
import '../../Utils/colors.dart';
import '../../Utils/images.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/app_elevated_button.dart';
import '../../Widget/app_icon_button.dart';
import 'Login.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}
final GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                        height: 260,
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
                            key: formKey4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Change Password",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,color: AppColor.kPurpleColor),
                                ),
                                Container(
                                  height: 20,
                                ),
                                Container(
                                    height: 60,
                                    child: Consumer<AuthProvider>(builder: (context , authProvider, child){
                                      return MyTextField(
                                        validator: (value){
                                          if(value!.isEmpty){
                                            "Please enter a password"; // Display error message if password is empty
                                          }
                                          if (value.length < 6) {
                                            return "Password must be at least 6 characters"; // Display error message if password length is less than 6
                                          }
                                          return null; // Return null if password is valid
                                        },
                                        errorText: "",
                                        obscureText: authProvider.setPasswordVisibility,
                                        hintText: "Set Password",
                                        controller: authProvider.resetsetpasswordText,
                                        preffixIcon: const Icon(Icons.lock_open_outlined,
                                          color: AppColor.kLightPurpleColor,
                                        ),
                                        suffixIcon:AppIconButton(
                                          icon: authProvider.setPasswordVisibility == false? Icons.visibility_off:Icons.visibility,
                                          onPressed: (){
                                            print("sabahat");
                                            authProvider.setPassword();
                                          },
                                        ) ,
                                      );
                                    }) ),

                                Container(
                                    height: 60,
                                    child: Consumer<AuthProvider>(builder: (context , authProvider, child){
                                      return MyTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter a password"; // Display error message if password is empty
                                          }
                                          if (value.length < 6) {
                                            return "Password must be at least 6 characters"; // Display error message if password length is less than 6
                                          }
                                          if (value != authProvider.resetsetpasswordText.text) {
                                            return "Passwords do not match"; // Display error message if passwords do not match
                                          }
                                          return null; // Return null if password is valid
                                        },
                                        errorText: "",
                                        obscureText: authProvider.confirmPaswordVisibility,
                                        hintText: "Confirm Password",
                                        controller: authProvider.resetconfirmpasswordText,
                                        preffixIcon: const Icon(Icons.lock_open_outlined,
                                          color: AppColor.kLightPurpleColor,
                                        ),
                                        suffixIcon:AppIconButton(
                                          icon:authProvider.confirmPaswordVisibility== false? Icons.visibility_off:Icons.visibility,
                                          onPressed: (){
                                            authProvider.confirmPassword1();
                                          },
                                        ) ,
                                      );
                                    }) ),
                              Container(height: 12,),
                                AppElevatedButton(title: "Change",onPressed: (){
                                  if(formKey4.currentState!.validate()){
                                    Get.to(LoginScreen());
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
