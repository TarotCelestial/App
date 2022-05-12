import 'package:get/get.dart';
import 'package:tarotcelestial/repos/http_repo.dart';

class ChatAdminController extends GetxController {
  bool isLoading = true;
  List tarotists = [];
  init(){
    HttpRepo().getFullTarotistas().then((value) {
      tarotists = value;
      isLoading = false;
      update();
    });
  }
}