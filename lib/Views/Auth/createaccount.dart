import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:namazreminderapp/Views/Auth/Login.dart';
import 'package:namazreminderapp/Views/Home_Screen/homescreen.dart';
import 'package:provider/provider.dart';

import '../../Provider/Authprovider.dart';
import '../../Utils/colors.dart';
import '../../Utils/images.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/app_elevated_button.dart';
import '../../Widget/app_icon_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}
 final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  return emailRegex.hasMatch(email);
}
class _CreateAccountState extends State<CreateAccount> {

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
                  top: MediaQuery.of(context).size.height * 0.45,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 350,
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
                            key: formKey2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Create Account",
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
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter a username"; // Display error message if username is empty
                                      }
                                      // Add additional username validation logic if needed
                                      return null; // Return null if username is valid
                                    },
                                    errorText: "",
                                    hintText: "Username",
                                    controller: authProvider.usernameText,
                                    preffixIcon: const Icon(Icons.person,
                                      color: AppColor.kLightPurpleColor,
                                    ),
                                  );
                                }) ),


                                Container(
                                    height: 60,
                                    child: Consumer<AuthProvider>(builder: (context , authProvider, child){
                                      return MyTextField(
                                        obscureText: false,
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
                                        hintText: "Enter Email",
                                        controller: authProvider.createAccountemailText,
                                        preffixIcon: const Icon(Icons.email_outlined,
                                          color: AppColor.kLightPurpleColor,
                                        ),
                                      );
                                    }) ),

                                Container(
                                    height: 60,
                                    child: Consumer<AuthProvider>(builder: (context , authProvider, child){
                                      return MyTextField(
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return"Please enter password";
                                          }
                                          if(value.length> 6){
                                            return"Password must be at least 6 character";
                                          }
                                          return null;
                                        },
                                        errorText: "",
                                        obscureText:  authProvider.setPasswordVisibility,
                                        hintText: "Set Password",
                                        controller: authProvider.createAccountsetpasswordText,
                                        preffixIcon: const Icon(Icons.lock_open_outlined,
                                          color: AppColor.kLightPurpleColor,

                                        ),
                                        suffixIcon:AppIconButton(
                                          icon: authProvider.setPasswordVisibility == false ?Icons.visibility_off:Icons.visibility,
                                          onPressed: (){
                                            authProvider.setPassword();
                                          },
                                        ) ,
                                      );
                                    }) ),

                                Container(
                                    height: 60,
                                    child: Consumer<AuthProvider>(builder: (context , authProvider, child){
                                      return MyTextField(
                                        obscureText:  authProvider.confirmPaswordVisibility,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter a password"; // Display error message if password is empty
                                          }
                                          if (value.length < 6) {
                                            return "Password must be at least 6 characters"; // Display error message if password length is less than 6
                                          }
                                          if (value != authProvider.createAccountsetpasswordText.text) {
                                            return "Passwords do not match"; // Display error message if passwords do not match
                                          }
                                          return null; // Return null if password is valid
                                        },
                                        errorText: "",
                                        hintText: "Confirm Password",
                                        controller: authProvider.createAccountconfirmpasswordText,
                                        preffixIcon: const Icon(Icons.lock_open_outlined,
                                          color: AppColor.kLightPurpleColor,
                                        ),
                                        suffixIcon:AppIconButton(
                                          icon: authProvider.confirmPaswordVisibility == false? Icons.visibility_off:Icons.visibility,
                                          onPressed: (){
                                            authProvider.confirmPassword1();
                                          },
                                        ) ,
                                      );
                                    }) ),

                                Container(
                                  height: 40,
                                  child: AppElevatedButton(title: "Create",onPressed: (){
                                            if(formKey2.currentState!.validate()){
                                             Get.back();
                                            }

                                  },),
                                )
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
                                  text: 'Already have an Account? ',
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
