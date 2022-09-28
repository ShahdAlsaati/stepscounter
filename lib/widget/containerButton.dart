import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  Icon? someIcone;
  ContainerButton(this.someIcone);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height*0.06 ,
      width:MediaQuery.of(context).size.width*0.13 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          200
        ),
        color: Colors.green
      ),
      child: Center(
        child:someIcone!,
      ),
    );
  }
}
