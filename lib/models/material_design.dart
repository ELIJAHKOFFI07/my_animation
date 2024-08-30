import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_animation/models/datas.dart';

class MyDivider extends Divider{
  MyDivider():super(
color: Colors.grey,
thickness: 1
);
}
class Myscaffold extends Scaffold{
  final String title;
  final Widget destination;

  Myscaffold(this.title, this.destination):super(
    appBar: AppBar(
      title: Text(title,style: GoogleFonts.signika(fontSize:30),),
    ),
    body: destination
  );
}

class EmptyWidget extends Center{
EmptyWidget():super(
  child: Image.asset(Datas().flutter)

);}