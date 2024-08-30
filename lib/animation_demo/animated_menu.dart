import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_animation/models/datas.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'dart:math' as math;
class AnimatedMenu extends StatefulWidget {
  const AnimatedMenu({super.key});

  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu> with SingleTickerProviderStateMixin {
   late AnimationController animationController;
   Duration duration=const Duration(seconds: 2);
  late  Animation<double> scale;
  late Animation<double>move;
  late Animation<double>rotation;
  late CurvedAnimation curvedAnimation;
   @override
  void initState() {
    // TODO: implement initState
     animationController=AnimationController(vsync: this,duration: duration);
     curvedAnimation=CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    scale=Tween<double>(begin:1,end: 0 ).animate(curvedAnimation);
     move=Tween<double>(begin: 0,end: 75).animate(curvedAnimation);
     rotation=Tween<double>(begin: 0,end:math.pi*4).animate(curvedAnimation);

    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animationController,
    builder: (BuildContext context, Widget? child) {
      return Transform.rotate(
          angle: rotation.value,
      child: stack());
    }






    );}
  Stack stack(){
     return Stack(
       alignment: Alignment.center,
       children: [
         menuChoice(Icons.access_alarm, Colors.tealAccent, "0", closeMenu, 0),
         menuChoice(Icons.access_alarm, Colors.pink, "1", closeMenu, 90),
         menuChoice(Icons.access_alarm, Colors.purpleAccent, "2", closeMenu, 180),
         menuChoice(Icons.access_alarm, Colors.green, "3", closeMenu, 270),


         Transform.scale(
             scale: scale.value-1,
             child: fab(Icons.close, Colors.red, "close",closeMenu)
         ),

         Transform.scale(
           scale: scale.value,
             child: fab(Icons.menu, Colors.blue, "Open",openMenu)
         )
       ],
     );
  }
  FloatingActionButton fab(IconData icon,Color color,String tag,VoidCallback onPressed){
return FloatingActionButton(onPressed: onPressed
  ,heroTag: tag,
  backgroundColor: color,
  child:Icon(icon),
);


  }
   FloatingActionButton menufab(IconData icon,Color color,String tag,){
     return FloatingActionButton(onPressed: (){
       menuSelected(color);

     }
       ,heroTag: tag,
       backgroundColor: color,
       child:Icon(icon),
     );


   }
  menuChoice(IconData icon,Color color, String tag,VoidCallback onPressed,double angle){
     double radian=radians(angle);
     double x=move.value*math.cos(radian);
     double y=move.value*math.sin(radian);

     return Transform(transform:Matrix4.identity()..translate(x,y) ,
       child:menufab(icon, color, tag,),
     );
  }
openMenu(){
     animationController.forward();
}
closeMenu(){
     animationController.reverse();
}
menuSelected(Color color){
     closeMenu();
     Datas().pusher(context, color.toString(), Container(color: color,));
}
}
