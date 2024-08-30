import 'package:flutter/material.dart';
class AnimatedPhysicalDemo extends StatefulWidget {
  const AnimatedPhysicalDemo({super.key});

  @override
  State<AnimatedPhysicalDemo> createState() => _AnimatedPhysicalDemoState();
}bool anim=false;

class _AnimatedPhysicalDemoState extends State<AnimatedPhysicalDemo> {
  @override
  Widget build(BuildContext context) {
    double max=MediaQuery.sizeOf(context).width;
    return Center(
      child: InkWell(
        child: AnimatedPhysicalModel(
          shape: BoxShape.rectangle,
          elevation: anim?8:0,
          color: anim?Colors.lightGreenAccent:Colors.deepOrangeAccent,
          shadowColor: anim?Colors.grey:Colors.white,

          duration: const Duration(seconds: 2),
          child: Container(
            height: max,
            width: max,
          ),

        ),
        onTap: (){
          setState(() {
            anim=!anim;
          });
         }
        ,
      ),
    );
  }
}
