import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/datas.dart';
class AnimationListener extends StatefulWidget {
  const AnimationListener({super.key});

  @override
  State<AnimationListener> createState() => _AnimationListenerState();
}

class _AnimationListenerState extends State<AnimationListener> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool opacity=false;
  Duration duration=const Duration(seconds: 2);
  late Animation<double>animation;
  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync: this,duration: duration);
    animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceOut))
   ..addStatusListener((status) {
     if(status==AnimationStatus.completed){
     setState(() {
       opacity=true;
     });
     }
     else if(status==AnimationStatus.dismissed){
       // animationController.forward();

     }
   });
   //  ..addListener(() {
   //    if(animationController.isCompleted){
   //      animationController.reverse();
   //    }
   //    else if(animationController.isDismissed){
   //      Datas().pusher(context, "Nouvelle Page", Center(child: Text("Nouvelle page",style: GoogleFonts.pacifico(fontSize:34),)));
   //    }
   //
   //
   //  });
    animationController.forward();

    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: animation,
        child: AnimatedOpacity(opacity: opacity?0.2:1,
            duration: duration,
          child: Image.asset(Datas().flutter),
        ),
      ),
    );
  }
}
