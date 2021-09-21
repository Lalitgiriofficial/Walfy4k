import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:walfy4k/Utils/Wallpaper_model.dart';
import 'package:walfy4k/pages/SearchPage.dart';

class MainTitle extends StatelessWidget {
  List<Photos> wallpapers;

  MainTitle({required this.wallpapers});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = new TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Walfy4k",
            style: TextStyle(color: Colors.deepOrange, fontSize: 20),
            textScaleFactor: 2,
          ),
        ),
        Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                  validator: (value) {
                    if (value.isEmptyOrNull) {
                      return "Invalid input";
                    }
                  },
                ).w(245),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Search(
                              searchQuery: textEditingController.text,
                            )));
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )
              ],
            )),
        SizedBox(height: 5)
      ],
    );
  }
}
