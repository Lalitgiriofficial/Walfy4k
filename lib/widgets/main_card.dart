import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walfy4k/pages/WallpaperPage.dart';
class MainCard extends StatelessWidget {
  final String image;

  MainCard({Key? key, this.image='android/assets/1.jpg'}) : super(key: key);
   static double getrandom(){
     final double y=Random().nextInt(250)/100;
     if(y<1.2)return getrandom();
     else return y;
   }
   final double y=getrandom();
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
     onTap: (){
       Navigator.push(context,MaterialPageRoute(builder: (context)=>WallPaperPage(image: this.image,)));
     },
      child: AspectRatio(
        aspectRatio: 1/y,
        child: Hero(
          tag: Key(this.image),
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(this.image ),
                fit: BoxFit.cover,

              ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),),
    );
  }
}
