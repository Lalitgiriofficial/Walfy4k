import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MainBackButton extends StatelessWidget {
  const MainBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Icon(
        Icons.arrow_back_sharp,
        color: Colors.black87,
        size: 30,
      ),
    );
  }
}
