import 'package:flutter/material.dart';
import 'package:stepcounter/widget/dailyCounter.dart';
import 'package:stepcounter/widget/textWidget.dart';


class DailyAverage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
    ),
    child: Container(
    height:MediaQuery.of(context).size.height*0.25,
    width:MediaQuery.of(context).size.width ,
    decoration: BoxDecoration(
    color:const Color(0xff103768),
    borderRadius: BorderRadius.circular(10),
    ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: TextWidget("Daily Average", 20)
            ),
            SizedBox(height: 50,),
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  DailyCounter("S", 0.7, Colors.red),
                  DailyCounter("M", 0.1, Colors.cyan),
                  DailyCounter("TU", 0.2, Colors.teal),
                  DailyCounter("W", 0.3, Colors.amber),
                  DailyCounter("TH", 0.4, Colors.green),
                  DailyCounter("FRI", 0.5, Colors.indigo),
                  DailyCounter("SAT", 0.6, Colors.purple),
                ],
              ),
            )


          ],
        ),
      ),
    )
    );
  }
}
