import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 1)
class UserData extends HiveObject{
  @HiveField(0)
  Map<String, dynamic> personalData;

  UserData(this.personalData);
}