import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  var emailText = TextEditingController();
  var createAccountemailText = TextEditingController();
  var forgotPasswordText = TextEditingController();
  var usernameText = TextEditingController();
  var passwordText = TextEditingController();
  var createAccountconfirmpasswordText = TextEditingController();
  var resetconfirmpasswordText = TextEditingController();
  var createAccountsetpasswordText = TextEditingController();
  var resetsetpasswordText = TextEditingController();
  var forgotText = TextEditingController();
  bool passwordVisibility= true;
   bool setPasswordVisibility = true ;
   bool confirmPaswordVisibility = true;
  //todo:login password visibility


  void loginPassword() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }
  //todo:Reset password visibility
  void setPassword(){
    setPasswordVisibility = !setPasswordVisibility;
    notifyListeners();
  }
  //todo:Reset password visibility
  void confirmPassword1(){
    confirmPaswordVisibility = !confirmPaswordVisibility;
    notifyListeners();
  }



}