import 'package:flutter/material.dart';
class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  @override
  State<AnimatedListDemo> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final GlobalKey<AnimatedListState>key=GlobalKey<AnimatedListState>();
  List<String>items=[
    "Banane","Poire","Pêche","Abricot"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: "Ajouter un Fruit"),
          onSubmitted: (fruit){
            addItems(fruit);

          },
        ),Expanded(child:
        AnimatedList(
          key: key,
          initialItemCount: items.length,
          itemBuilder:(context,index,animation){
            return slideTile(items[index], index, animation );

          } ,
        ))
      ],
    );
  }
Widget slideTile(String name,int index,Animation animation){
    return SlideTransition(position: animation .drive(
        Tween(begin: const Offset(1,0),
          end: const Offset(0,0)
        )),
      child: ListTile(
        title: Text(name),
        leading: Text(index.toString()),
        trailing: IconButton(
          onPressed: () {
            removeItems(index);

          }, icon: const Icon(Icons.delete),),
      ),
    );
}
addItems(String name){
    int index=items.length;
    items.insert(index, name);
    key.currentState?.insertItem(index);

}
removeItems(int index){
    String name=items[index];
    items.removeAt(index);
    //
    key.currentState?.removeItem(index, (context, animation) => slideTile(name, index, animation));


}
}
