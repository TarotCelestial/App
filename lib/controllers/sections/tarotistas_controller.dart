import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/repos/personalized_firebase_chat_core_repo.dart';

import '../../repos/http_repo.dart';

class TarotistasController extends GetxController{
  var tarotistas;
  init(){
    HttpRepo().getTarotistas().then((data){
      tarotistas=data;
      if(tarotistas==null){
        return;
      }
      update();
    });
  }
  getUsers(){
    Stream stream = PersonalizedFirebaseChatCoreRepo.instance.filtredUsers([]);
    stream.listen((data) {
      print(data.toString());
    }, onDone: () {
      print("Task Done");
    }, onError: (error) {
      print("Some Error");
    });
  }
}