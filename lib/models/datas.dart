import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_animation/models/material_design.dart';

import 'fruit.dart';
import 'greek_city.dart';

class Datas{
  String flutter="images/flutter_logo.png";
  static String athenes = "images/Greek Cities/Athens.jpg";
  static String corfou = "images/Greek Cities/Corfou.jpg";
  static String delphi = "images/Greek Cities/Delphi.jpg";
  static String meteores = "images/Greek Cities/Meteores.jpg";
  static String santorin = "images/Greek Cities/Santorin.jpg";
  static String sounion = "images/Greek Cities/Sounion.jpg";


  pusher(BuildContext context,String title,Widget destination){

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>Myscaffold(title, destination)
      )
    );
  }
  List<GreekCity> cities = [
    GreekCity("Athenes", athenes, "Athènes, capitale actuelle de la Grèce, était également le cœur de la Grèce antique, une civilisation riche et puissante. Les monuments construits au Ve siècle av. J.-C. continuent de dominer la ville, comme la citadelle de l’Acropole, qui a été érigée au sommet d’une colline. Elle est surplombée par d’autres constructions anciennes telles que le temple à colonnes du Parthénon. Le musée de l’Acropole et le musée national archéologique exposent des sculptures, des vases, des bijoux et d’autres objets de l’époque antique."),
    GreekCity("Santorin", santorin, "Santorin est l'une des îles des Cyclades, dans la mer Égée. Elle a été détruite par une éruption volcanique au XVIe siècle av. J.-C., qui a définitivement façonné ses paysages accidentés. Les maisons blanches en forme de cube de ses 2 villes principales, Fira et Oia, sont accrochées sur des falaises surplombant une caldeira (cratère) sous-marine. Elles dominent la mer, des petites îles à l'ouest ainsi que des plages composées de galets de lave noirs, rouges et blancs."),
    GreekCity("Meteores", meteores, "Les Météores sont une formation géologique du nord de la Grèce, en Hestiotide, dans la vallée du Pénée. Ils abritent des monastères chrétiens orthodoxes perchés au sommet de falaises et pitons rocheux gris, sculptés par l'érosion. Le site est inscrit au patrimoine mondial de l'UNESCO depuis 1988"),
    GreekCity("Sounion", sounion, "Le cap Sounion est un cap de Grèce qui s'avance à 45 kilomètres au sud-est d’Athènes dans la mer Égée et qui constitue l'extrémité de l'Attique. Il est surtout renommé pour les ruines d'un temple dédié à Poséidon. Il est classé parmi les parcs nationaux de Grèce."),
    GreekCity("Corfou", corfou, "Corfou, une île au large de la côte nord-ouest de la mer Ionienne, se caractérise par ses montagnes escarpées et ses nombreuses stations balnéaires. Son patrimoine culturel témoigne d’années passées sous domination vénitienne, française et britannique, avant son rattachement à la Grèce en 1864. La ville de Corfou, dominée par deux forteresses vénitiennes imposantes, dispose de ruelles médiévales sinueuses, d’une arcade à l’architecture française et du grand palais de St. Michel et St. Georges."),
    GreekCity("Delphes", delphi, "Delphes  est le site d'un sanctuaire panhellénique, situé au pied du mont Parnasse, en Phocide, où parle l'oracle d'Apollon à travers sa prophétesse, la Pythie ; il abrite également l'Omphalos ou « nombril du monde ». Investie d'une signification sacrée, Delphes est du vie au ive siècle av. J.-C. le véritable centre et le symbole de l'unité du monde grec. La Pythie se trouve assise dans une salle du temple d’Apollon et parlait au nom du dieu. Elle répondait aux questions qui lui étaient posées en émettant des cris inarticulés, aussitôt traduits en phrases par des prêtres. Les sanctuaires panhelléniques sont des complexes architecturaux extérieurs aux cités. Ils constituent les seuls lieux où tous les anciens Grecs, et certains barbares (Lydiens et Étrusques) prennent part à des célébrations religieuses communes."),
  ];

  static List<Fruit>fruits= [
    Fruit(name: "Poire"), Fruit(name: "Abricot"),Fruit(name: "pomme"),Fruit(name: "escargot")

  ];
}