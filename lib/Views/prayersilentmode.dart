import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazreminderapp/Utils/colors.dart';
import 'package:namazreminderapp/Widget/textwidget.dart';

class PrayerSlient_mode extends StatefulWidget {
  const PrayerSlient_mode({Key? key}) : super(key: key);

  @override
  State<PrayerSlient_mode> createState() => _PrayerSlient_modeState();
}

class _PrayerSlient_modeState extends State<PrayerSlient_mode> {
  List<String> listOfprayers = ["Fajer", "Zohar", "Asar", "Magrib", "Ishaa", ];

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        backgroundColor: AppColor.kLightPurpleColor,
          title: TextWidget(title: 'Silent Mode',
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
              TextWidget(title: "Prayer Silent Mode",
                fontSize: 18,
              fontFamily: "FuturaBoldBT.ttf",
              fontWeight: FontWeight.bold,),
              const SizedBox(height: 11,),
              TextWidget(title: "Set the time to auto on silent mode during Prsyer",
                fontSize: 12,
                fontFamily: "FuturaBoldBT.ttf",
              color: Colors.grey,),
              const SizedBox(height: 20,),
              Container(
                color: Colors.white24,
                height: 800,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: ( context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 130,
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
          const SizedBox(width: 210,),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
      const SizedBox(height: 11,),
      Column(
        children: [
          Row(
            children: [
              TextWidget(title: "Start Time",fontSize: 9,),
              const SizedBox(width: 32,),
              TextWidget(title: "End Time",fontSize: 9,),


            ],
          ),
          const SizedBox(height: 9,),
          Row(
            children: [
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColor.kLightPurpleColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Center(child: TextWidget(title: '4:28',fontSize: 12,)),
              ),
              const SizedBox(width: 30,),
              Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColor.kLightPurpleColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: TextWidget(title: '4:28',fontSize: 12,)
                  )
              ) ],
          )

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
