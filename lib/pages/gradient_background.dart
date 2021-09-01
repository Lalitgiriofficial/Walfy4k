
import 'package:flutter/cupertino.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;final EdgeInsets pading;
  GradientBackground({required this.child, this.pading=EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: this.pading,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff0b001d),
                Color(0xff543379),

              ]
          )
      ),
      child: this.child,
    );
  }


}
