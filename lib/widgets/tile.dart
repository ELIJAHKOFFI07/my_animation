import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/datas.dart';
import '../models/section.dart';

class Tile extends StatelessWidget {
  final Section section;
   Tile({ required this.section});

  @override
  Widget build(BuildContext context) {
        return ListTile(
      leading:Icon(section.icon) ,
      title: Text(section.name,style: GoogleFonts.signika(fontSize:20),),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: (){
        return  Datas().pusher(context, section.name, section.destination);

      },
    );
  }
}
