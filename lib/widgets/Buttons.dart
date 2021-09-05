import 'package:flutter/material.dart';

class MainButtons extends StatelessWidget {
  const MainButtons(
      {Key? key, required this.text, required this.icon, required this.color})
      : super(key: key);

  final String text;
  final IconData icon;
  final Color color;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new Container(
          child: Icon(this.icon,size: 40,color: Colors.grey[500],),
          decoration: BoxDecoration(
              color:this.color,
              shape: BoxShape.circle
          ),
          padding: EdgeInsets.all(3),
        ),
        Text(this.text, style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.grey[300], fontSize: 16),),
      ],
    );
  }
}
