import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_animation/models/material_design.dart';
import 'package:my_animation/models/transition_type.dart';

import '../models/datas.dart';
class AnimationControllerDemo extends StatefulWidget {
   AnimationControllerDemo({super.key, required this.type});
final  TransitionType type;
  @override
  State<AnimationControllerDemo> createState() => _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo> with SingleTickerProviderStateMixin {
  Image image=Image.asset(Datas().flutter);
  late AnimationController animationController;
  late DecorationTween decorationTween;
  late Animation <Decoration>animationDecoration;
  late CurvedAnimation curvedAnimation;
  bool anim=false;
  late double max;

  Duration duration=const Duration(seconds: 1);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: duration);
    curvedAnimation=CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    setupDecoration();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  //Configurer le decoration tween
  setupDecoration(){
    BoxDecoration begin=BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15));
    BoxDecoration end=BoxDecoration(color: Colors.orangeAccent,borderRadius: BorderRadius.circular(500));
decorationTween=DecorationTween(begin: begin,end: end);
animationDecoration=decorationTween.animate(curvedAnimation);

  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
     max=size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: max,
          width: max,
          child: Center(
            child: transition(),
          ),
        ),
        TextButton(onPressed: (){
          performTransition();
        }, child: Text("Faire la transition ",style: GoogleFonts.signika(fontSize:24),))
      ],

    );
  }
  Widget transition(){
    switch(widget.type){
      case TransitionType.decoratedBox : return decoratedBox();
      case TransitionType.fade:return fade();
      case TransitionType.positionned:return positionned();
      case TransitionType.rotation:return rotation();
      case TransitionType.scale: return scale();
      case TransitionType.size:return size();
      case TransitionType.slide:return slide();
      default:return EmptyWidget();
    }
  }
  Widget positionned(){
    return Stack(
      children: [
        PositionedTransition(
            rect: RelativeRectTween(
                begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
                end:  RelativeRect.fromLTRB(max,max,max,max)
            ).animate(curvedAnimation) ,
            child: Container(color: Colors.orange,)  ),
        PositionedTransition(
            rect: RelativeRectTween(
                begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
                end: const RelativeRect.fromLTRB(200,250,0,0)
            ).animate(curvedAnimation) ,
            child: image  ),


      ],
    );
  }
  DecoratedBoxTransition decoratedBox(){
    return DecoratedBoxTransition(decoration: animationDecoration,
        child:image
    );

  }
  FadeTransition fade(){
    return FadeTransition(
      opacity: Tween<double>(begin: 1,end: 0).animate(CurvedAnimation(
          parent: animationController,
          curve: Curves.bounceOut)
      ),
    child: image,);
  }
  RotationTransition rotation(){
    return RotationTransition(
        turns:curvedAnimation,
      child: image,
    );

  }
  ScaleTransition scale(){
    return ScaleTransition(
      scale: curvedAnimation,
    child: image,);
  }
  performTransition(){
    (anim)?animationController.reverse():animationController.forward();
    setState(() {
      anim=!anim;
    });
  }
  SizeTransition size(){
    return SizeTransition(sizeFactor:Tween<double>(begin: 1,end: 0.2).animate(curvedAnimation) ,
    child: image,
      axis: Axis.horizontal,

    );
  }
  SlideTransition slide(){
    return SlideTransition(
        position: Tween<Offset>(
            begin: Offset(1,1),
            end: Offset(0,0)
        ).animate(curvedAnimation));
  }
}
