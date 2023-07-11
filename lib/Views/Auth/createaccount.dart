import 'package:flutter/material.dart';
import 'package:namazreminderapp/Views/Auth/Login.dart';

import '../../Utils/colors.dart';
import '../../Utils/images.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var usernameText = TextEditingController();
  var emailText = TextEditingController();
  var SetPasswordText = TextEditingController();
  var ConfirmPasswordText = TextEditingController();
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
                  top: MediaQuery.of(context).size.height * 0.45,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 350,
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
                                "Create Account",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold,color: AppColor.kPurpleColor),
                              ),
                              Container(
                                height: 30,
                              ),
                              Container(
                                height: 45,
                                child: TextFormField(
                                  controller: usernameText,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.person,
                                          color: AppColor.kLightPurpleColor),
                                      hintText: "Username",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: AppColor.kLightPurpleColor,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color:
                                                  AppColor.kLightPurpleColor))),
                                ),
                              ),
                              Container(
                                height: 12,
                              ),
                              Container(
                                height: 45,
                                child: TextFormField(
                                  controller: emailText,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email,
                                          color: AppColor.kLightPurpleColor),
                                      hintText: "Email",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: AppColor.kLightPurpleColor,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color:
                                                  AppColor.kLightPurpleColor))),
                                ),
                              ),
                              Container(
                                height: 12,
                              ),
                              Container(
                                height: 45,
                                child: TextFormField(
                                  controller: SetPasswordText,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: AppColor.kLightPurpleColor,
                                      ),
                                      hintText: "SetPassword",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: AppColor.kLightPurpleColor,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color:
                                                  AppColor.kLightPurpleColor))),
                                ),
                              ),
                              Container(
                                height: 12,
                              ),
                              Container(
                                height: 45,
                                child: TextFormField(
                                  controller: ConfirmPasswordText,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: AppColor.kLightPurpleColor,
                                      ),
                                      hintText: "ConfirmPassword",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: AppColor.kLightPurpleColor,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color:
                                                  AppColor.kLightPurpleColor))),
                                ),
                              ),
                              Container(height: 11,),

                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.kPurpleColor,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text("Create")),
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
                            text: TextSpan(
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
