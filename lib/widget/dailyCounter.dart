import 'package:flutter/material.dart';
import 'package:stepcounter/widget/textWidget.dart';
import 'package:percent_indicator/percent_indicator.dart';
class DailyCounter extends StatelessWidget {
  String? day;
  double? percentage;
  Color? colors;
  DailyCounter(
      this.day,
      this.percentage,
      this.colors,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height*0.1,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
               CircularPercentIndicator(
                 radius: 15,
                 percent: percentage!,
                 animation: true,
                 progressColor: colors,
                 circularStrokeCap: CircularStrokeCap.round,
                 lineWidth: 2,
               ),
              SizedBox(height: 5,),
              TextWidget("$day",11),
            ],
          ),
        ),
      ),
    );
  }
}
