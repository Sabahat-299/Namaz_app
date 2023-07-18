
import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Views/Auth/forgot.dart';

class AppTextButton extends StatelessWidget {
  String title;
   void Function()? onPressed;
   AppTextButton({Key? key,required this.title,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: onPressed,
          child: Text(title, style: TextStyle( color:Colors.grey),),

          ),
    );
  }
}
