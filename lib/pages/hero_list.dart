import 'package:flutter/material.dart';

import '../animation_demo/hero_widget.dart';
import '../models/datas.dart';
import '../models/greek_city.dart';
import 'hero_detail.dart';

class HeroList extends StatelessWidget {
  List<GreekCity> _cities = Datas().cities;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemBuilder: (context, i) {
          GreekCity city = _cities[i];
          HeroWidget hero = HeroWidget(city.image);
          return InkWell(
            child: Container(
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(padding: EdgeInsets.all(5),height: 100, width: 125, child: hero),
                    Text(city.name),
                  ],
                ),
              ),
            ),
            onTap: () {
              Datas().pusher(context, city.name, HeroDetail(city, hero));
            },
          );
        },
        itemCount: _cities.length
    );
  }

}