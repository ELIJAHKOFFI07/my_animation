
import 'package:flutter/material.dart';

import '../models/datas.dart';
class AnimatedCrossFadeDemo extends StatefulWidget {
  const AnimatedCrossFadeDemo({super.key});

  @override
  State<AnimatedCrossFadeDemo> createState() => _AnimatedCrossFadeState();
}

class _AnimatedCrossFadeState extends State<AnimatedCrossFadeDemo> {
  bool cross=true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){
          setState(() {
            cross=!cross;
          });
        },
        child: AnimatedCrossFade(
          firstChild: Image.asset(Datas().flutter),
          secondChild:const Text("Retour à l'image",style: TextStyle(fontSize: 30),) ,
          crossFadeState:(cross)? CrossFadeState.showFirst:CrossFadeState.showSecond,

          duration: const Duration(seconds: 1),
          firstCurve: Curves.bounceIn,
          secondCurve: Curves.bounceOut,

        ),
      ),
    );
  }
}
