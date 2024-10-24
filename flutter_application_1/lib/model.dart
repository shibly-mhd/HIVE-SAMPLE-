import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class person {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? age;

  person({
    required this.name,
    required this.age,
  });
}
