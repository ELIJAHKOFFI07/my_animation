import 'package:flutter/material.dart';
import 'package:my_animation/models/datas.dart';

class FadeInAnimation extends StatelessWidget {
  Duration duration_in =const Duration(seconds: 1);
   FadeInAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage(
        placeholder:AssetImage(Datas().flutter) ,//image de remplacement
        image:const NetworkImage("https://images.pexels.com/photos/27402207/pexels-photo-27402207/free-photo-of-ville-art-rue-building.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1") ,
      fadeInCurve: Curves.linear,
        fadeInDuration: duration_in,
        fadeOutCurve: Curves.linear,
        fadeOutDuration: duration_in,
      ),
    );
  }
}
