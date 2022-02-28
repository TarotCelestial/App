import 'package:get/get.dart';

import '../../repos/http_repo.dart';

class TarotistasController extends GetxController{
  var Tarotistas;
  init(String token) async {
    Tarotistas= await HttpRepo().getTarotistas(token);
    if(Tarotistas==null){
      return;
    }
    print(Tarotistas);
  }
}