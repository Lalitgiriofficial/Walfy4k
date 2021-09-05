import 'package:flutter/material.dart';
import 'package:walfy4k/Utils/Wallpaper_model.dart';
import 'package:walfy4k/widgets/main_card.dart';
import 'package:velocity_x/velocity_x.dart';

class WallpaperList extends StatefulWidget {
 final  List<Photos> wallpapers;
final List<Widget> column1 , column2 ;


  @override
  WallpaperListState createState() => WallpaperListState();

 WallpaperList({required this.wallpapers,required this.column1,required this.column2});
}

class WallpaperListState extends State<WallpaperList> {





  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.column1,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start, children: widget.column2),
        )
      ],
    );
  }
}
