import 'package:flutter/material.dart';
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key,required this.image,required this.child, this.padding=EdgeInsets.zero}) : super(key: key);
final String image;
final Widget child;
final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(this.image),
              fit: BoxFit.cover
          )
      ),
      child: this.child,
    );
  }
}
