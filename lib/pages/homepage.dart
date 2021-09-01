import 'package:flutter/material.dart';
import 'package:walfy4k/pages/gradient_background.dart';

import 'package:walfy4k/widgets/list_wallpaper.dart';

import 'package:walfy4k/widgets/main_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: GradientBackground(
      pading: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTitle(),
            SizedBox(
              height: 20,
            ),
            WallpaperList()

          ],
        ),
      ),
    ));
  }
}
