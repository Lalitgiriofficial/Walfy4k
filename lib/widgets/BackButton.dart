import 'package:flutter/material.dart';
class MainBackButton extends StatelessWidget {
  const MainBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pop(),
      child: Icon(Icons.arrow_back_sharp,color: Colors.white,size: 40,),
    );
  }
}
