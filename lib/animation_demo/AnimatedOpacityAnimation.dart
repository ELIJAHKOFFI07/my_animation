import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_animation/models/datas.dart';
class AnimatedOpacityDemo extends StatefulWidget {
  AnimatedOpacityDemo({super.key});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
  bool isOpacity=false;
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children()

    ) ;
  }
  List<Widget> children(){
    List<Widget> c=[];
    c.add(Text("Opacité",style: GoogleFonts.signika(fontSize:23),));
  c.add(AnimatedOpacity(opacity: (widget.isOpacity)?0:1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceOut,
    child: Image.asset(Datas().flutter),
  )
  );
    c.add( TextButton(onPressed: (){
      setState(() {
        widget.isOpacity=!widget.isOpacity;
      });
    },
        child: Text(widget.isOpacity?"Montrer":"cacher",style: GoogleFonts.signika(fontSize:25),)

    )
    );
    return c;


  }
}
