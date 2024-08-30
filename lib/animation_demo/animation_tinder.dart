import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_animation/models/datas.dart';

import '../models/greek_city.dart';
class TinderAnimDemo extends StatefulWidget {
  const TinderAnimDemo({super.key});

  @override
  State<TinderAnimDemo> createState() => _TinderAnimDemoState();
}

class _TinderAnimDemoState extends State<TinderAnimDemo>  with SingleTickerProviderStateMixin{
 late AnimationController animationController;
 late Animation<double>turn;
 late CurvedAnimation animation;
 bool details=false;
 Duration duration=const Duration(milliseconds: 750);
 List<GreekCity>cities=Datas().cities;
late Animation<Offset>move;
  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync: this,duration: duration);
animation=CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
setupRotation(0.2);
setupMove(-1);

    super.initState();
  }
  Widget build(BuildContext context) {
    return Stack(
      children: cards(),
    );
  }

  List<Widget>cards(){
    List<Widget>c=[];
    for(int x=0;x<cities.length;x++){
      double bottom=10.0*x+20;
      double top=(5.0-x)*10;
      Card newTindercard=tinderCard(cities[x]);
      if(x==0){
RelativeRect rect= RelativeRect.fromLTRB(10, top, 10, bottom);
RotationTransition transition=RotationTransition(
  turns: turn,
  child: newTindercard,
);
SlideTransition slideTransition=SlideTransition(position: move,
child: transition,);
AnimatedPositioned pos=AnimatedPositioned(
  left:(details)?0:rect.left ,
    top:(details)? 0:rect.top,
    bottom:(details)?0: rect.bottom,
    right:(details)? 0:rect.right,
    duration: duration,
    child: slideTransition,
    );
c.add(pos);
      }
      else{
        Positioned positioned=Positioned(child: newTindercard,top: top,bottom: bottom,left: 10,right: 10,);
        c.add(positioned);

      }
    }
    return c.reversed.toList();
  }
  Card tinderCard(GreekCity city){
    return Card(
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: const EdgeInsets.all(10),
              child: Text(city.name),
            ),
            Image.asset( city.image),

            Padding(padding: const EdgeInsets.all(10),



                child: AnimatedCrossFade(
                  firstChild: btns(city.name),
                  secondChild:  InkWell(
                    onTap: (){
                      setState(() {
                        details=!details;
                      });
                    },
                    child: Text(city.description,
                      style: GoogleFonts.poppins(fontSize:15),),
                  ),
                  crossFadeState: details?CrossFadeState.showSecond:CrossFadeState.showFirst,
                  duration: duration,

                ))
            ,
          ],
        ),
      ),
    );

  }
  setupRotation(double value){
    turn=Tween<double>(begin: 0,end: value).animate(animation);

  }
  setupMove(double value){
        move=Tween<Offset>(begin: Offset(0, 0),end: Offset(value,0)).animate(animation)..addStatusListener((status) {
          if(status==AnimationStatus.completed){
            animationController.reset();
            setState(() {
              GreekCity firstcity=cities[0];
              cities.removeAt(0);
              cities.add(firstcity);
            });

          }
        });
  }

  Row  btns(name){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(onPressed: (){
          setState(() {
            details=!details;
            setupRotation(-0.2);
            setupMove(-2);
            animationController.forward();
          });
        },
      backgroundColor: Colors.greenAccent,
      heroTag: name+"Like",
        child: const Icon(Icons.thumb_up,
          color: Colors.blueGrey,
        ),),
        FloatingActionButton(onPressed: (){
          setState(() {
            details=!details;

          });
        },
          backgroundColor: Colors.blueAccent,
          heroTag: name+"details",
          child: const Icon(Icons.search_sharp,
            color: Colors.blueGrey,
          ),),
        FloatingActionButton(onPressed:  (){
          setState(() {
            setupRotation(2);
            setupMove(1);

            animationController.forward();
          });
        },
          backgroundColor: Colors.red,
          heroTag: name+"disLike",
          child: const Icon(Icons.thumb_down,
            color: Colors.blueGrey,
          ),),

      ],
    );
  }
}
