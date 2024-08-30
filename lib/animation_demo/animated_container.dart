import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Duration duration=const Duration(seconds: 2);
  double min=0;
  double max=300;
  double heigtvalue=150;
  double widthValue=150;
  Color _color=Colors.tealAccent;
  bool shadow=true;
  bool raduis=true;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(15)),

        AnimatedContainer(
          height: heigtvalue,
            width: widthValue,
            decoration: BoxDecoration(
              color: _color,
              boxShadow:  [
                BoxShadow(
                  color:  Colors.grey,
                  offset: (shadow)?const Offset(3,0):const Offset(0, 0),
                  spreadRadius:(shadow) ?2.5:0,
                  blurRadius: (shadow)?3:0
                ),

              ],
              borderRadius:(raduis)?BorderRadius.circular(10):BorderRadius.circular(0)
            ),


            duration: duration,
          curve: Curves.bounceOut,

        ),
        const Padding(padding: EdgeInsets.all(10)),
        Expanded(child:ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                colorButton("bleu", Colors.blue),
                colorButton("Rouge", Colors.red),
                colorButton("green", Colors.green)

              ],
            ),
            const SizedBox(height: 20,),
            Column(


              crossAxisAlignment: CrossAxisAlignment.start,


              children: [
                Text("Modification de la hauteur : ${heigtvalue.round()}",style: GoogleFonts.signika(fontSize:24),),
                Slider(
                  min: min,
                    max: max,
                    value: heigtvalue,
                    activeColor: _color,
                    inactiveColor: Colors.pink,
                    onChanged: (newValue){
                      setState(() {
                        heigtvalue=newValue;

                      });
                    }
                )
              ],
            ),
            Column(


              crossAxisAlignment: CrossAxisAlignment.start,


              children: [
                Text("Modification de la largeur : ${widthValue.round()}",style: GoogleFonts.signika(fontSize:24),),
                 Slider(
                    min: min,
                    max: max,
                    value: widthValue,
                    activeColor: _color,
                    inactiveColor: Colors.pink,
                    onChanged: (newValue){
                      setState(() {
                        widthValue=newValue;

                      });
                    }
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Ombre",style: GoogleFonts.signika(fontSize:20),),
                Switch(value: shadow,
                    activeColor: (shadow)?_color:Colors.pink,

                    onChanged: (newValue){
                  setState(() {
                    shadow=newValue;
                  });
                }),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Raduis",style: GoogleFonts.signika(fontSize:20),),
                Switch(value: raduis,
                    activeColor: (raduis)?_color:Colors.pink,

                    onChanged: (newValue){
                      setState(() {
                        raduis=newValue;
                      });
                    }),
              ],
            )

          ],
        )

        )
        // toutes les variations
      ],
    );
  }
  FloatingActionButton colorButton(String name, Color color){
    return FloatingActionButton(onPressed: (){

      setState(() {
        _color=color;
      });
    },
      heroTag:name ,
      backgroundColor: color,

    );

  }
}
