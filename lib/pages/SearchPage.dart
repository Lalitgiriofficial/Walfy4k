import 'package:flutter/material.dart';
import 'package:walfy4k/Utils/Wallpaper_model.dart';
import 'package:walfy4k/Utils/api_key.dart';
import 'package:walfy4k/pages/gradient_background.dart';
import 'package:walfy4k/widgets/BackButton.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as https;
import 'dart:convert' as convert;
import 'package:flutter/services.dart';
import 'package:walfy4k/widgets/list_wallpaper.dart';
import 'package:walfy4k/widgets/main_card.dart';

class Search extends StatefulWidget {
  final String searchQuery;

  Search({required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textEditingController = new TextEditingController();

  List<Photos> wallpapers = [];
  List<Widget> column1 = [], column2 = [];
  late Future<List<Photos>> wp = [] as Future<List<Photos>>;

  @override
  void initState() {
    wp = getSearchWallpapers(widget.searchQuery);
    addWallpaper();
    super.initState();
    populateList();
    textEditingController.text = widget.searchQuery;
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  void addWallpaper() async {
    wallpapers = await wp;
    setState(() {});
  }

  Future<List<Photos>> getSearchWallpapers(String searchQuery) async {
    var url = 'https://api.pexels.com/v1/search?query=$searchQuery&per_page=6';
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

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(),
        elevation: 0.0,
        title:   Container(
            height: 45,
            width: 280,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30)),
            // margin: EdgeInsets.symmetric(
            //     horizontal: 25, vertical: 10),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                TextFormField(
                  autocorrect: true,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Wallpaper',
                  ),
                ).w(200),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Search(
                                searchQuery:
                                textEditingController
                                    .text)));
                  },

                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )
              ],
            )),
        toolbarHeight: 80,
      ),
        resizeToAvoidBottomInset: false,
        body: GradientBackground(
          pading: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: wallpapers.length != 0
              ? SingleChildScrollView(
            physics: ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      children: [

                        WallpaperList(
                            wallpapers: wallpapers,
                            column1: column1,
                            column2: column2)
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.transparent,
                  ),
                ),
        ));
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
