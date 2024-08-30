import 'package:flutter/material.dart';
import 'package:my_animation/animation_demo/AnimatedOpacityAnimation.dart';
import 'package:my_animation/animation_demo/FadeInAnimation.dart';
import 'package:my_animation/animation_demo/animated_cross_fade.dart';
import 'package:my_animation/animation_demo/animated_positionnement.dart';
import 'package:my_animation/animation_demo/animated_size.dart';
import 'package:my_animation/animation_demo/animated_text_style.dart';
import 'package:my_animation/animation_demo/animatedphysicaldemo.dart';
import 'package:my_animation/models/material_design.dart';
import 'package:my_animation/widgets/tile.dart';

import '../models/section.dart';

class OtherAnimatedList extends StatelessWidget {
  List<Section> sections=[
  Section(name: "Fade In ",
  icon: Icons.add_alarm,
  destination: FadeInAnimation()
  ),
    Section(name: "Opacité ",
        icon: Icons.add_alarm,
        destination: AnimatedOpacityDemo()
    ),
    Section(name: "Cross Fade ",
        icon: Icons.add_alarm,
        destination: AnimatedCrossFadeDemo()
    ),
    Section(name: "TextStyle ",
        icon: Icons.add_alarm,
        destination: AnimatedTextSlyleDemo()
    ),
    Section(name: "Taille",
        icon: Icons.add_alarm,
        destination: AnimatedSizeDemo()
    ),
    Section(name: "Positionnement",
        icon: Icons.add_alarm,
        destination: AnimatedPositionDemo()
    ),
    Section(name: "PhisicalModel",
        icon: Icons.menu,
        destination: AnimatedPhysicalDemo()
    ),



  ];
   OtherAnimatedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
return Tile(section: sections[index]);
    },
        separatorBuilder: (context,index){
return MyDivider();
        },
        itemCount: sections.length);
  }
}
