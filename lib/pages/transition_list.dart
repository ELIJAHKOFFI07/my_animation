import 'package:flutter/material.dart';
import 'package:my_animation/animation_demo/animation_controller.dart';
import 'package:my_animation/models/material_design.dart';
import 'package:my_animation/models/section.dart';
import 'package:my_animation/models/transition_type.dart';
import 'package:my_animation/widgets/tile.dart';
class TransitionList extends StatelessWidget {
   TransitionList({super.key});
final List<Section>sections=[
  Section(name: "DecoratedBox", icon: Icons.compare_arrows, destination: AnimationControllerDemo(type: TransitionType.decoratedBox)),
  Section(name: "Fade", icon: Icons.compare_arrows, destination: AnimationControllerDemo(type: TransitionType.fade,)),
  Section(name: "Positionned", icon: Icons.compare_arrows, destination: AnimationControllerDemo(type: TransitionType.positionned,)),
  Section(name: "Rotation", icon: Icons.compare_arrows, destination: AnimationControllerDemo(type: TransitionType.rotation,)),
  Section(name: "Scale", icon: Icons.compare_arrows, destination: AnimationControllerDemo(type: TransitionType.scale,)),
  Section(name: "Size", icon: Icons.compare_arrows, destination: AnimationControllerDemo(type: TransitionType.size,)),
  Section(name: "Slide", icon: Icons.compare_arrows, destination: AnimationControllerDemo(type: TransitionType.slide,)),

];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return Tile(section: sections[index]);

    }, separatorBuilder: (context,index){
      return MyDivider();

    }, itemCount: sections.length);
  }
}
