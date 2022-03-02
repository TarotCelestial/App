import 'package:get/get.dart';

import '../../repos/http_repo.dart';

class TarotistasController extends GetxController{
  var tarotistas;
  init(){
    HttpRepo().getTarotistas().then((data){
      tarotistas=data;
      if(tarotistas==null){
        print(tarotistas);
        return;

      }
      update();
    });
  }
}