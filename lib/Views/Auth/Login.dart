import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namazreminderapp/Provider/Authprovider.dart';
import 'package:namazreminderapp/Widget/app_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:namazreminderapp/Views/Auth/createaccount.dart';
import 'package:namazreminderapp/Views/Auth/forgot.dart';
import 'package:namazreminderapp/Widget/Textfield.dart';
import '../../Utils/appstyle.dart';
import '../../Utils/colors.dart';
import '../../Utils/images.dart';
import '../../Widget/app_elevated_button.dart';
import '../../Widget/app_text_button.dart';
import '../Home_Screen/homescreen.dart';

// ? , selector , parameter
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  return emailRegex.hasMatch(email);
}
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
                          child: Form(
                            key: formKey1,
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
                                Consumer<AuthProvider>(builder: (context , authProvider, child){
                                  return Container(
                                    height: 60,
                                    child: MyTextField(
                                      errorText: "",
                                      obscureText: false,
                                      validator: (value){
                                        if (value!.isEmpty) {
                                          return "Please enter an email"; // Display error message if email is empty
                                        }
                                        if (!isValidEmail(value)) {
                                          return "Please enter a valid email"; // Display error message if email format is invalid
                                        }
                                        return null; // Return null if email is valid
                                      },
                                      hintText: "Enter Email",
                                      controller: authProvider.emailText,
                                      preffixIcon: const Icon(Icons.email_outlined,
                                        color: AppColor.kLightPurpleColor,
                                      ),
                                    ),
                                  );
                                }),

                                Container(
                                    height: 60,
                                    //Todo is ko apny acces karna h with selector //selector , consumer , instance
                                    child: Consumer<AuthProvider>(builder: (context , authProvider, child){
                                      return MyTextField(
                                        validator: (value){
                                          if (value!.isEmpty) {
                                            return "Please enter a password"; // Display error message if password is empty
                                          }
                                          if (value.length < 6) {
                                            return "Password must be at least 6 characters"; // Display error message if password length is less than 6
                                          }
                                          return null; // Return null if password is valid
                                        },
                                        errorText: "",
                                        obscureText: authProvider.passwordVisibility,
                                        hintText: "Password",
                                        controller: authProvider.passwordText,
                                        preffixIcon: const Icon(Icons.lock_open_outlined,
                                          color: AppColor.kLightPurpleColor,
                                        ),
                                        suffixIcon:AppIconButton(
                                          icon: authProvider.passwordVisibility == false ? Icons.visibility_off:Icons.visibility ,
                                          onPressed: (){
                                            print("sabahat");
                                           authProvider.loginPassword();
                                          },
                                        ) ,
                                      );
                                    }) ),
                                AppTextButton(title: "Forgot Password",onPressed: (){
                                  Get.to(FortgotPasswordScreen());
                                },),
                                AppElevatedButton(title: "Login",onPressed: (){
                                  if(formKey1.currentState!.validate()){
                                    print("Sabahat login");
                                    Get.offAll(const HomeScreen(),);
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
                       Get.to(CreateAccount());
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

