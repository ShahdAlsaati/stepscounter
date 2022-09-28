import 'package:flutter/material.dart';
import 'package:stepcounter/widget/iconColumn.dart';

class ButtonNav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color(0xff224A88),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(width: 20,),
          IconColumn(Icon(Icons.home, color: Colors.green,size: 40,), "Home"),
          IconColumn(Icon(Icons.auto_graph_outlined, color: Colors.green,size: 40,), "Report"),
          IconColumn(Icon(Icons.health_and_safety, color: Colors.green,size: 40,), "Health"),
          IconColumn(Icon(Icons.settings, color: Colors.green,size: 40,), "Settings"),

        ],
      ),
    );
  }
}
