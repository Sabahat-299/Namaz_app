import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Widget/textwidget.dart';

class ReminderSetting extends StatefulWidget {
  const ReminderSetting({Key? key}) : super(key: key);

  @override
  State<ReminderSetting> createState() => _ReminderSettingState();
}

class _ReminderSettingState extends State<ReminderSetting> {
  List<String> listOfprayers = ["Fajer", "Zohar", "Asar", "Magrib", "Ishaa", ];
  List<String> listOfminutes = ["10 Minutes", "15 Minutes", "20 Minutes", "25 Minutes", "30 Minutes", ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.white
          ),
          backgroundColor: AppColor.kLightPurpleColor,
          title: TextWidget(title: 'Reminder Setting',
            fontFamily: "FuturaMediumBT.ttf",
            fontSize: 16,color: Colors.black ,)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              TextWidget(title: "Reminder Setting",
                fontSize: 18,
                fontFamily: "FuturaBoldBT.ttf",
                fontWeight: FontWeight.bold,),
              const SizedBox(height: 11,),
              TextWidget(title: "Set the alarm to get reminder befor prayer",
                fontSize: 12,
                fontFamily: "FuturaBoldBT.ttf",
                color: Colors.grey,),
              const SizedBox(height: 20,),
              Container(
                color: Colors.white24,
                height: 800,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ( context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // Specifies the position of the shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextWidget(title:listOfprayers[index],fontSize: 13,fontFamily:"FuturaMediumBT.ttf" ,
                                    fontWeight: FontWeight.bold,),
                                  const SizedBox(width: 70,),
                                  TextWidget(title: 'Reminder me before',color:Colors.grey,fontSize: 12,),
                                  const SizedBox(width: 5,),
                                  TextWidget(title: listOfminutes[index],color: AppColor.kPurpleColor,fontSize: 12,)


                                ],
                              ),


                            ],

                          ),
                        ),

                      ),
                    );
                  },


                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
