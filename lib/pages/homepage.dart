import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as https;
import 'dart:convert' as convert;
import 'package:walfy4k/Utils/Wallpaper_model.dart';
import 'package:walfy4k/Utils/api_key.dart';
import 'package:walfy4k/pages/gradient_background.dart';
import 'package:walfy4k/widgets/list_wallpaper.dart';
import 'package:walfy4k/widgets/main_card.dart';
import 'package:walfy4k/widgets/main_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photos> wallpapers = [];
  List<Widget> column1 = [], column2 = [];
  late Future<List<Photos>> wp = [] as Future<List<Photos>>;

  @override
  void initState() {
    super.initState();
    wp = getTrendingWallpapers();
    addWallpaper();
    populateList();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  void addWallpaper() async {
    wallpapers = await wp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GradientBackground(
              pading: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: wallpapers.length != 0
                  ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTitle(
                      wallpapers: wallpapers,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    WallpaperList(
                      wallpapers: wallpapers,
                      column1: column1,
                      column2: column2,
                    ),
                  ],
                ),
              )
                  : Center(
                child: CircularProgressIndicator(
                  color: Colors.transparent,
                ),
              ))),
    );
  }

  // Future<Photos> getPhotos() async{
  //  return await new Network().getTrendingWallpapers();
  //
  // }
  Future<List<Photos>> getTrendingWallpapers() async {
    var url = 'https://api.pexels.com/v1/curated?per_page=7';
    var response = await https
        .get(Uri.parse(url), headers: {"Authorization": ApiKey.apiid});
    var data = convert.jsonDecode(response.body) as Map<String, dynamic>;
    await data["photos"].forEach((element) {
      Photos photos = new Photos.fromMap(element);
      wallpapers.add(photos);
    });

    setState(() {});
    return Future.value(wallpapers);
  }

  void populateList() async {
    wallpapers = await wp;

    for (int i = 1; i <= wallpapers.length; i++) {
      if (i.isOdd) {
        column1.add(
          MainCard(image: wallpapers[i - 1].src.original),
        );
      } else
        column2.add(MainCard(image: wallpapers[i - 1].src.original));
    }
  }
}
