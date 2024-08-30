import 'package:flutter/material.dart';
import 'package:my_animation/animation_demo/animated_menu.dart';
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.orange,
      child: AnimatedMenu(),
    );
  }
}
