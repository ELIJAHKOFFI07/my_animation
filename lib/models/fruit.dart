import 'package:hive/hive.dart';
part 'fruit.g.dart';
@HiveType(typeId: 0)
class Fruit{
  @HiveField(0)
  final String name;

  const Fruit({required this.name});
  String key()=>name.hashCode.toString();// identifiant unique pour les fruits
}