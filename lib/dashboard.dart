import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:stepcounter/widget/DashBoardCard.dart';
import 'package:stepcounter/widget/buttonNav.dart';
import 'package:stepcounter/widget/containerButton.dart';
import 'package:stepcounter/widget/dailyAverage.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:stepcounter/widget/topTextBotton.dart';

class DashBoard extends StatefulWidget {

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  double x=0.0,y=0.0,z=0.0,previousDistance=0.0,distance=0.0,addValue=0.025,miles=0.0,calories=0.0,duration=0.0;
  int steps=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<AccelerometerEvent>(
        stream:SensorsPlatform.instance.accelerometerEvents,
        builder:(context,snapshot){
          if(snapshot.hasData){
            x=snapshot.data!.x;
            y=snapshot.data!.y;
            z=snapshot.data!.z;
            distance=getValue(x, y, z);
            if(distance>30)
              {
                steps++;
              }
            calories=calculateCalories(steps);
            miles=calculateMiles(steps);
            duration=calculateDuration(steps);
          }
          return Stack(
            children: [
              Container(
                height:MediaQuery.of(context).size.height ,
                width:MediaQuery.of(context).size.width ,
                decoration:const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:[
                        Color(0xff0C1E4E),
                        Color(0xff224A88),
                      ] ),


                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height ,
                width:MediaQuery.of(context).size.width ,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: kToolbarHeight,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            TopText("Today",
                                true,
                                    (){
                                  print("This was tapped");
                                }),
                            TopText("Plane",
                                false,
                                    (){
                                  print("This was tapped");
                                }),
                            TopText("Daily",
                                false,
                                    (){
                                  print("This was tapped");
                                }),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            ContainerButton(
                                const Icon(
                                  Icons.arrow_drop_down,
                                  size: 50,
                                  color: Colors.white,
                                )
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        child: DashBoardCard(steps,miles,calories,duration),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        child: DailyAverage(),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          );
        },
      ),





        bottomNavigationBar:ButtonNav(),
    );
  }
  double getValue(double x,double y,double z) {
    double magnitude=sqrt(x*x+y*y+z*z);
    getPreviousValue();
    double modDistance=magnitude -previousDistance;
    setPreviousValue(magnitude);
    return modDistance;
   }


   void setPreviousValue(double distance)async{
  SharedPreferences _pref= await SharedPreferences.getInstance();
  _pref.setDouble("preValue", distance);
 }

  void getPreviousValue()async{
    SharedPreferences _pref= await SharedPreferences.getInstance();
    setState(() {
      _pref.getDouble("preValue")??0.0;
    });
  }
  double calculateMiles(int steps){
    double  milesValue=(2.2*steps)/5280;
    return milesValue;
 }
  double calculateDuration(int steps){
    double  durationValue=(steps*1/1000);
    return durationValue;
  }

  double calculateCalories(int steps){
    double  caloriesValue=(steps*0.0566);
    return caloriesValue;
  }

}
