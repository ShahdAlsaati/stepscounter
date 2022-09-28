import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepcounter/widget/containerButton.dart';
import 'package:stepcounter/widget/imageContainer.dart';
import 'package:stepcounter/widget/textWidget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DashBoardCard extends StatelessWidget {
  int? steps;
  double? miles,calories,duration;
  DashBoardCard(this.steps,this.miles,this.calories,this.duration);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        height:MediaQuery.of(context).size.height*0.5,
        width:MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(
          color:const Color(0xff103768),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                    flex: 3,
                    child: Container(
                      child:Column(
                        children: [
                          Container(
                            // height:80 ,
                            width:150 ,
                            child: Row(
                              children: [
                               TextWidget("$steps", 40),
                                SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height:30 ,
                              width:100 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  70
                                ),
                                color: Colors.white
                              ),
                              child: Center(
                                child: Text(
                                  "Pause",
                                 style: GoogleFonts.aBeeZee(
                                   color: Colors.green,
                                   fontSize: 25,
                                 ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                    SizedBox(width: 130,),
                    Expanded(
                        flex: 1,
                        child: ContainerButton(Icon(Icons.play_arrow,color: Colors.white,size: 40,)),

                    ),
                    SizedBox(width: 20,)
                  ],
                ),
              ),
              const   SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearPercentIndicator(
                  progressColor: Colors.green,
                  animation: true,
                  percent: 0.8,
                  lineHeight: 10,
                ),
              ),
       const   SizedBox(
              height: 40,
            ),
              Row(
                children: [

                  ImageContainer("assets/locations.png",miles!.toStringAsFixed(1),"Miles"),
                  ImageContainer("assets/calories.png",calories!.toStringAsFixed(1),"calories"),
                  ImageContainer("assets/stopwatch.png",duration!.toStringAsFixed(1),"Duration"),

                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
