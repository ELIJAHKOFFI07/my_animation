import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_animation/models/datas.dart';
import 'dart:math' as math;

class AnimatedBuilderDemo extends StatefulWidget {
  const AnimatedBuilderDemo({super.key});

  @override
  State<AnimatedBuilderDemo> createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  Image image=Image.asset(Datas().flutter);
  late Animation<double >scale;

  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 3))..repeat();
    super.initState();
    scale=Tween<double>(begin: 0.1,end:10).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context,child)=>
        //     Transform.rotate(
        //   angle: animationController.value *2* math.pi,
        //   child: child,
        // ),
        Transform.scale(
          scale: scale.value,child: child,
        ),

        child: image,
      ),
    );
  }
}
