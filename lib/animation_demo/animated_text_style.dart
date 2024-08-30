import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextSlyleDemo extends StatefulWidget {
  const AnimatedTextSlyleDemo({super.key});

  @override
  State<AnimatedTextSlyleDemo> createState() => _AnimatedTextSlyleDemoState();
}

class _AnimatedTextSlyleDemoState extends State<AnimatedTextSlyleDemo> {
  bool isFirst=true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap:(){
          setState(() {
            isFirst=!isFirst;

          });
        } ,
        child: AnimatedDefaultTextStyle(
          curve: Curves.bounceOut,
          style: (isFirst)?firstStyle():secondStyle(),
        duration: const Duration(seconds: 2),
        child: Text("Tap to change",style: GoogleFonts.signika()),
        
        ),
      ));

  }

TextStyle firstStyle(){
    return const TextStyle(
      color: Colors.orange,
      fontSize: 60,
      fontWeight: FontWeight.w100,
      // fontStyle: FontStyle.italic
    );

}
TextStyle secondStyle(){
  return const TextStyle(
      color: Colors.teal,
      fontSize: 40,
      fontWeight: FontWeight.w500,
      // fontStyle: FontStyle.italic
  );
}
}
