import 'package:flutter/material.dart';
import 'package:stepcounter/widget/textWidget.dart';

class IconColumn extends StatelessWidget {
   Icon? icons;
   String? title;
   IconColumn(this.icons,this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 20
      ),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: icons,

          ),
          TextWidget(title!, 15)
        ],
      ),
    );
  }
}
