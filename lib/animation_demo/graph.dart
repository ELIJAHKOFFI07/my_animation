import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/exercise.dart';
import 'dart:math' as math;
class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  int currentWeek=0;
  List<Exercise>exercises=[
    Exercise(0),
    Exercise(1),
    Exercise(2),
    Exercise(3)
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double max=MediaQuery.sizeOf(context).width*0.9;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Semaine numéro${currentWeek+1}",style:GoogleFonts.poppins(fontSize:21),),
        Container(width: max,height:max ,child: Card(
          child: charts(max, exercises[currentWeek]),

        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextButton(onPressed: (){
            setState(() {
              if(currentWeek>0) currentWeek-=1;
            });

          }, child: Text("Précedent",style:GoogleFonts.poppins(fontSize:21 ,))),
        TextButton(onPressed: (){
          setState(() {
            if(currentWeek<exercises.length-1) currentWeek+=1;
          });

        }, child: Text("Suivant",style:GoogleFonts.poppins(fontSize:21 ,))),

          ],
        )
      ],
    );
  }

  Row charts(double max,Exercise exercise){
    double width=max /10;
    int maxRun= exercise.runs.reduce(math.max);// valeur maximale dans le tableau
    double ratio= max/maxRun;
    List<AnimatedContainer>containers=[];
    exercise.runs.forEach((element) {
      Color color =getColor(element, maxRun);
      containers.add(container(width, ratio*element, element, color));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: containers,
    );

  }
  Color getColor(int value,int max){
    if(max*0.75<value) return Colors.green;
    else if(max*.05<value) return Colors.yellow;
    else if(max*.025<value) return Colors.orange;
    else return Colors.red;

  }
  AnimatedContainer container( double width,double height , int value,Color color){
    return AnimatedContainer(
      width: width,
      height: height,
      duration: const Duration(seconds: 1),curve: Curves.bounceOut,color: color,
    child: Center(child:  Text(value.toString()),)
      ,);
  }
}
