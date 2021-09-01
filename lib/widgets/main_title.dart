import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class MainTitle extends StatelessWidget {
  const MainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Walfy4k",
          style: TextStyle(color: Colors.white, fontSize: 40),
          textScaleFactor: 1.25,
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "7 Wallpapers available",
            style: TextStyle(color: Colors.white70, fontSize:18),

          ),
        ),
      ],
    );
  }
}
