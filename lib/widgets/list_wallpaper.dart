import 'package:flutter/material.dart';
import 'package:walfy4k/widgets/main_card.dart';
import 'package:velocity_x/velocity_x.dart';
class WallpaperList extends StatefulWidget {
  
  @override
  _WallpaperListState createState() => _WallpaperListState();
}

class _WallpaperListState extends State<WallpaperList> {
  List<Widget> column1=[],column2=[];

  final int qtdWallpaper=7;

  void populateList(){
    for(int i=1;i<=qtdWallpaper;i++){
      if(i.isOdd)column1.add(MainCard(image: 'android/assets/${i.toString()}.jpg',));
      else column2.add(MainCard(image: 'android/assets/${i.toString()}.jpg',));
    }
  }
 @override
  void initState() {
    populateList();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return     Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  column1,
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
            children: column2
          ),
        )
      ],
    );
  }
}
