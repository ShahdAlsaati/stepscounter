import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TopText extends StatelessWidget {
      String text="";
      bool? isActive;
      Function? onTap;
      TopText(
          this.text,
          this.isActive,
          this.onTap,
          );
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(

        onTap: (){
          onTap;
        },
        child: Container(
          child: Column(
            children: [
              Text(

                "$text",
                style: GoogleFonts.aBeeZee(

                  color:isActive!?Colors.green:Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Visibility(
                visible: isActive!,
                child: Container(

                  height: 1,
                  width: 70,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
