import 'package:flutter/material.dart';
import 'package:walfy4k/Utils/WallpaperPage_widgets.dart';
import 'package:walfy4k/widgets/BackButton.dart';
import 'package:walfy4k/widgets/Buttons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'homepage.dart';
class WallPaperPage extends StatelessWidget {
  final String image;


  WallPaperPage({required this.image});

  @override
  Widget build(BuildContext context) {
    return  Hero(
      tag: Key(this.image),
      child: Stack(
        children: [
          BackgroundImage(
          image: this.image,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               MainBackButton().py20(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                       MainButtons(text: "Info", icon: Icons.info_outline,color: Colors.grey.shade700,),
                    MainButtons(text: "Download", icon: Icons.download_rounded,color: Colors.grey.shade700,),
                    MainButtons(text: "Apply", icon: Icons.check_rounded,color: Colors.pinkAccent.shade700,),
                  ],
                )

              ],
            ).p(20),),

        ],
      )
    );
  }
}
