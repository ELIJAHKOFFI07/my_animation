import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/datas.dart';
class AnimatedPositionDemo extends StatefulWidget {
  const AnimatedPositionDemo({super.key});

  @override
  State<AnimatedPositionDemo> createState() => _AnimatedPositionDemoState();
}

class _AnimatedPositionDemoState extends State<AnimatedPositionDemo> {
  bool connected=false;
  Duration duration=const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    double max=size.width*0.8;
    double centerTop= max/2 -20;
    double centerBottom=max/2 -20;
    return Center(
      child: Container(
        height: max,
        width: max,

        child: InkWell(
          onTap: (){
            setState(() {
              connected=!connected;
            });
          },
          child: Card(
            elevation: 8,
            child: Stack(
              children: [
                AnimatedPositioned(
                    left: 10,
                  right: 10,
                  bottom: max /2 -20,
                  top: max /2 -20,
                    duration: duration,
                    child: const TextField(
                      decoration: InputDecoration(hintText: "Entrer mail"),
                    ),


                ),
                AnimatedPositioned(
                  left: 10,
                  right: 10,
                  bottom: (connected)?centerBottom:10,
                  top:(connected)?centerTop: max -40,
                  duration: duration,
                  child: const TextField(
                    decoration: InputDecoration(hintText: "Entrer mot de passe"),
                  ),


                ),

                //enchainement de 2 animations
                AnimatedPositioned(
                  top:(connected)? 0:10,
                  bottom:(connected)? 0:max -100,
                  left: (connected)? 0:10,
                  right: (connected)? 0:max-100,
                  duration: duration,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(connected?0:10)
                    ),
                    duration: duration,
                    child: Image.asset(Datas().flutter,fit: BoxFit.contain,),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
