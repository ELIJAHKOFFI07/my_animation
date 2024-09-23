import 'package:flutter/material.dart';
import 'package:my_animation/models/FruitDatabase.dart';
import 'package:my_animation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await FruitDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}


