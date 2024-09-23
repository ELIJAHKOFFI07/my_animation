import 'package:hive/hive.dart';
import 'package:my_animation/models/fruit.dart';
import 'package:path_provider/path_provider.dart';

import 'datas.dart';

class FruitDatabase{

  static final instance=FruitDatabase();
  static late Box box;

  static Future<void>init()async{
    // recuperation du path
    final dir=await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    // choix de la classe générée
    Hive.registerAdapter(FruitAdapter());
    //ouverture de la table
    box=await Hive.openBox("fruit");
    var value=box.values;
    // si la table est vide on ajoute les elements de notre liste
    if(value.isEmpty){
      box.putAll(Map.fromIterable(Datas.fruits,key: (fruit)=>fruit.key(),value: (fruit)=>fruit));
    }

  }



}