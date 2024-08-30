import 'package:flutter/material.dart';

import '../animation_demo/hero_widget.dart';
import '../models/greek_city.dart';

class HeroDetail extends StatelessWidget {
  final HeroWidget hero;
  final GreekCity city;
  HeroDetail(this.city, this.hero);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        hero,
        Text(city.description)
      ],
    );
  }
}