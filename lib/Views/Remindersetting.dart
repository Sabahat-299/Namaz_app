import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/reminderscreenmodel.dart';
import '../Utils/colors.dart';
import '../Widget/textwidget.dart';

class ReminderSetting extends StatefulWidget {
  const ReminderSetting({Key? key}) : super(key: key);

  @override
  State<ReminderSetting> createState() => _ReminderSettingState();
}

class _ReminderSettingState extends State<ReminderSetting> {

  List<ReminderSettingModel> data=[
    ReminderSettingModel(
        prayerName: 'Fajer',
        minutes: '10 Minutes'
    ),
    ReminderSettingModel(
        prayerName: 'Zohar',
        minutes: '15 Minutes'
    ),
    ReminderSettingModel(
        prayerName: 'Asar',
        minutes: '20 Minutes'
    ),
    ReminderSettingModel(
        prayerName: 'Magrib',
        minutes: '25 Minutes'
    ),
    ReminderSettingModel(
        prayerName: 'Ishaa',
        minutes: '30 Minutes'
    ),

  ];
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


                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(title:data[index].prayerName,fontSize: 13,fontFamily:"FuturaMediumBT.ttf" ,
                                    fontWeight: FontWeight.bold,),
                                  //const SizedBox(width: 70,),
                                  TextWidget(title: 'Reminder me before',color:Colors.grey,fontSize: 12,),
                                  //const SizedBox(width: 5,),
                                  TextWidget(title: data[index].minutes,color: AppColor.kPurpleColor,fontSize: 12,)


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
