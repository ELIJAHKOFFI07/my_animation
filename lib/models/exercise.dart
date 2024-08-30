import 'dart:math';

class Exercise{
  final int week;
  late List<int>runs;
  Exercise(this.week){
    runs=[];
    for(var x=0;x<7;x++){
      runs.add(Random().nextInt(15));

    }


  }
}