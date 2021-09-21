import 'package:flutter/material.dart';
class MainBackButton extends StatelessWidget {
  Color color;


  MainBackButton(this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pop(),
      child: Icon(Icons.arrow_back_sharp,color: color,size: 40,),
    );
  }
}
