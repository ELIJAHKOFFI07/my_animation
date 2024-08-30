import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_animation/animation_demo/animated_builder.dart';
import 'package:my_animation/animation_demo/animated_container.dart';
import 'package:my_animation/animation_demo/animated_list_demo.dart';
import 'package:my_animation/animation_demo/animation_listener.dart';
import 'package:my_animation/animation_demo/animation_tinder.dart';
import 'package:my_animation/animation_demo/graph.dart';
import 'package:my_animation/models/material_design.dart';
import 'package:my_animation/pages/hero_list.dart';
import 'package:my_animation/pages/menupage.dart';
import 'package:my_animation/pages/other_animated_list.dart';
import 'package:my_animation/pages/transition_list.dart';

import '../models/datas.dart';
import '../models/section.dart';
import '../widgets/tile.dart';

class HomePage extends StatelessWidget {
  List<Section> sections=[
    Section(name: "Animated Container",
        icon: Icons.score,
        destination: AnimatedContainerDemo()
    ),
    Section(name: "Les autres animated",
        icon: Icons.movie_filter,
        destination: OtherAnimatedList()),
    Section(name: "Hero",
        icon: Icons.flash_on,
        destination: HeroList()),
    Section(name: "AnimatedList",
        icon: Icons.flash_on,
        destination: const AnimatedListDemo()),

    Section(name: "Transitions" ,
        icon: Icons.compare_arrows,
        destination: TransitionList()),
    Section(name: "AnimatedBuilder" ,
        icon: Icons.compare_arrows,
        destination: const AnimatedBuilderDemo()),

    Section(name: "Graphique" ,
        icon: Icons.compare_arrows,
        destination: const Graph()),
    Section(name: "Animation Listener" ,
        icon: Icons.compare_arrows,
        destination: AnimationListener()),
    Section(name: "Menu animated" ,
        icon: Icons.menu,
        destination:  MenuPage()),
    Section(name: "AnimationTinder" ,
        icon: Icons.holiday_village_sharp,
        destination:  TinderAnimDemo()),








  ];
   HomePage({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          margin: EdgeInsets.all(5),
          child: Image.asset(Datas().flutter),
        ),
        title: Text("Mes animations",style: GoogleFonts.signika(fontSize:30),),
      ),
      body:ListView.separated(
          itemBuilder: (context,index){
            return Tile(section: sections[index],);

          },
          separatorBuilder: (context,index){
            return MyDivider();
          },
          itemCount: sections.length
      ),
    );
  }


  }

