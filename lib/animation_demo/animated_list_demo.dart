import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_animation/models/FruitDatabase.dart';

import '../models/fruit.dart';
class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  @override
  State<AnimatedListDemo> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final GlobalKey<AnimatedListState>key=GlobalKey<AnimatedListState>();
  // List<String>items=[
  //   "Banane","Poire","Pêche","Abricot"
  // ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FruitDatabase.box.listenable(),
      builder: (BuildContext context, Box<dynamic> items, Widget? child) {
        // Liste de clés
        List<String> keys = items.keys.cast<String>().toList();

        return Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Ajouter un Fruit"),
              onSubmitted: (fruit) {
                addItems(fruit,keys.length);
              },
            ),
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: keys.length,
                itemBuilder: (context, index, animation) {
                  final fruit = items.get(keys[index]);
                  return slideTile(fruit, index, animation);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget slideTile(Fruit fruit,int index,Animation animation){
    return SlideTransition(position: animation .drive(
        Tween(begin: const Offset(1,0),
          end: const Offset(0,0)
        )),
      child: ListTile(
        title: Text(fruit.name),
        leading: Text(index.toString()),
        trailing: IconButton(
          onPressed: () {
            removeItems(fruit,index);

          }, icon: const Icon(Icons.delete),),
      ),
    );
}
addItems(String value,int index){
    Fruit fruit =Fruit(name: value);
  FruitDatabase.box.put(fruit.key(), fruit);
    key.currentState?.insertItem(index);

}
removeItems(Fruit fruit,int index){
    FruitDatabase.box.delete(fruit.key());
    Fruit tmp=fruit;

    //
    key.currentState?.removeItem(index, (context, animation) => slideTile(tmp, index, animation));


}
}
