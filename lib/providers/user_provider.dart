import 'package:flutter/foundation.dart';
import 'package:tarotcelestial/data/models/personal_data_model.dart';

class UserProvider with ChangeNotifier{
  PersonalData? _user;

  setUser(PersonalData user){
    _user=user;
  }
  PersonalData? get getUser => _user;
}