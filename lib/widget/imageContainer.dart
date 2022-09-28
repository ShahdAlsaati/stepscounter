import 'package:flutter/material.dart';
import 'package:stepcounter/widget/textWidget.dart';

class ImageContainer extends StatelessWidget {
  String? imagePath,number,textTitle;
  ImageContainer(
      this.imagePath,
      this.number,
      this.textTitle,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height*0.2,
      width:MediaQuery.of(context).size.width*0.29,
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath!),
                fit: BoxFit.fill
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget("$number", 16),
          ),

          TextWidget("$textTitle", 12),
        ],
      ),
    );
  }
}
