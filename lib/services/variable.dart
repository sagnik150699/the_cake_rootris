import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Variable {
  Text text(str, size, colour, weight) {
    return Text(
      str,
      textAlign: TextAlign.left,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(decoration: TextDecoration.none,color: colour, fontSize: size, fontWeight: weight),
      ),
    );
  }

  Text text2(str, size, colour, weight) {
    return Text(
      str,
      textAlign: TextAlign.left,
      style: GoogleFonts.alegreyaSansSc(
        textStyle: TextStyle(decoration: TextDecoration.none,color: colour, fontSize: size, fontWeight: weight),
      ),
    );
  }

  Stack stack( colour1, colour2, image, quote,price){
    return    Stack(
      children: [
        //contents of the container
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            //color: Color(0xFF8399D6),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colour1,
                colour2
                // const Color(0xffF082AC),
                // const Color(0xff90A8E8),
              ],
            ),
          ),
          width: 200,
          //Container column where image and stuffs are stored
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              text2("$quote",
                  20.0, Colors.black, FontWeight.w400),
              SizedBox(
                height: 5,
              ),
              //Price and add
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  text("$price", 15.0,
                      Colors.black45, FontWeight.normal),
                  IconButton(
                    onPressed: () => print("Add"),
                    color: Colors.white,
                    icon: Icon(Icons.add_box_rounded,color: Colors.white,size: 30,),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: 45,
          bottom: 125,
          child: Image.network(image,height: 300.0,width: 300.0,)
        ),
      ],
    );
  }

  Stack widthStack(){
    return Stack(children: [
      SizedBox(width: 10,)
    ],);
  }
  Stack widthBig(){
    return Stack(children: [
      SizedBox(width: 60,)
    ],);
  }


  Stack bottomStack( colour, colour1, imgHeight,imgWidth, imgAddress, text,){
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            //color: Color(0xFF8399D6),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
               colour,
                colour1
              ],
            ),
          ),
          width: 200,
        ),
        Container(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  height: imgHeight,
                  width: imgWidth,
                  image: AssetImage(imgAddress)),
              text2(text, 20.0, Colors.black, FontWeight.w500)
            ],
          ),
        )

      ],
    );
  }





}