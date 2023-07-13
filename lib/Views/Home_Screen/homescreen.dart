import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazreminderapp/Utils/images.dart';


import '../../Utils/colors.dart';
import '../../Widget/textwidget.dart';
import '../Remindersetting.dart';
import '../prayersilentmode.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
  ScrollController(); //To Track Scroll of ListView
  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<String> listOfprayers = ["Fajr", "Zohar", "Asar", "Magrib", "Ishaa", ];
  List<String> listOftime = ["4:30", "2:00", "5:30", "7:00", "9:00", ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240 ,
              decoration:  BoxDecoration(
                image:DecorationImage(image:AssetImage(AppImages.homescreenimage.toString()),
                fit: BoxFit.cover),
              ),
child:  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(

      children: [

        ListTile(
              leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(AppImages.profileimage.toString()),
            ),
            title: const Text("salam",style:TextStyle(fontSize: 11,fontFamily: "FutuBd.ttf",color: Colors.white)),
            subtitle: const Text("Sabahat Nosheen",style:TextStyle(fontSize: 13,fontFamily: "FutuBd.ttf",color: Colors.white)),
            trailing: Container(
  width: 70,
  child: Row(
    children: [
      Icon(Icons.settings_applications_outlined, color: Colors.white, size: 28),
      SizedBox(width: 7),
      Icon(Icons.doorbell_outlined, color: Colors.white, size: 28),
      SizedBox(width: 7),
    ],
  ),
),


        ),
Container(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Next Prayer:",style: TextStyle(fontSize: 12,fontFamily: "FuturaMediumBT.ttf",color: Colors.white),),
              Container(height: 11,),
              Row(
                children: [
                  const Text("Asar(Hanafi)",style: TextStyle(fontSize: 15,fontFamily: "FuturaMediumBT.ttf",color: Colors.white),),
                  Container(width: 120,),
                  Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Center(child: Text("Time Left ",style:TextStyle(fontSize: 12,color: Colors.grey))),
                        Text("14 Min ",style:TextStyle(fontSize: 15,color: AppColor.kPurpleColor)),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined,color: Colors.white,size: 11,),
                      Container(width: 11,),
                      const Text("4:40",style:TextStyle(fontSize: 11,color: Colors.white)),
                      Container(width: 11,),
                      const Icon(Icons.location_on,color: Colors.white,size: 11,),
                      Container(width: 11,),
                      TextWidget(title: 'Rawalpindi',
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: "FuturaBoldBT.ttf",
                      ),

                    ],
                  ),

                ],
              )

            ],
          ),
        )
      ],
  ),
),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(title: "Today's Progress",
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: "FuturaBoldBT.ttf",
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5,),
                  Container(
                      height: 30,
                      margin: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        selectedDate.day.toString() +
                            '-' +
                            listOfMonths[selectedDate.month - 1] +
                            ', ' +
                            selectedDate.year.toString(),
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.indigo[700]),
                      )),
                  const SizedBox(height: 10),
                  //To show Calendar Widget
                  Container(
                      height: 70,
                      child: Container(
                          child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 10);
                            },
                            itemCount: 365,
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentDateSelectedIndex = index;
                                    selectedDate =
                                        DateTime.now().add(Duration(days: index));
                                  });
                                },
                                child: Container(
                                  height: 80,
                                  width: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(3, 3),
                                            blurRadius: 5)
                                      ],
                                      color: currentDateSelectedIndex == index
                                          ? AppColor.kLightPurpleColor
                                          : Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        listOfMonths[DateTime.now()
                                            .add(Duration(days: index))
                                            .month -
                                            1]
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: currentDateSelectedIndex == index
                                                ? Colors.white
                                                : Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        DateTime.now()
                                            .add(Duration(days: index))
                                            .day
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: currentDateSelectedIndex == index
                                                ? Colors.white
                                                : Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        listOfDays[DateTime.now()
                                            .add(Duration(days: index))
                                            .weekday -
                                            1]
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: currentDateSelectedIndex == index
                                                ? Colors.white
                                                : Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ))),
                  const SizedBox(height: 20,),
                  SafeArea(
                    child: Container(
                      color: Colors.white24,
                      height: 300,
                      child: ListView.builder(
                        itemCount: listOfprayers.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 52,
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
                              
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(listOfprayers[index],style: const TextStyle(fontFamily: "FuturaBoldBT.ttf"),),
                                  )),
                                  const SizedBox(width:120,),
                                  Center(child: Text(listOftime[index])),

                                  const SizedBox(width:70,),
                                  const Align(alignment:Alignment.centerRight,
                                      child: Icon(Icons.check_circle,size: 20,color: Colors.green,)
                                  )



                                ],
                              ),

                            ),
                          );
                        },


                      ),
                    ),
                  )

  ],

              ),
            ),

          ],
        ),
        endDrawer: Drawer(
      child: ListView(
      children: [
        Padding(
        padding: EdgeInsets.zero,
        child: DrawerHeader(
          decoration: const BoxDecoration(color: AppColor.kLightPurpleColor),
          child: Column(
            children:  [
              const SizedBox(height: 50,),
              const Image(
                 width: 40,
                  height: 40,
                  image: AssetImage(AppImages.profileimage)),
              const SizedBox(height: 11,),
              TextWidget(title: 'Sabahat Nosheen',color: Colors.white,),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20,),
      ListTile(
        leading: const Icon(Icons.home_filled),
        title: TextWidget(title: 'Home',),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.search),
        title: TextWidget(title: 'Prayer Silent Mode',),
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PrayerSlient_mode()),);
        },
      ),
      ListTile(
        leading: const Icon(Icons.doorbell),
        title: TextWidget(title: 'Reminder Setting',),
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ReminderSetting()),);
        },
      ),
      const SizedBox(height: 170,),
      ListTile(
        leading: const Icon(Icons.logout),
        title: TextWidget(title: 'Logout',),
      ),
      ],
    ),
    ),
      ),
    );


  }
}
