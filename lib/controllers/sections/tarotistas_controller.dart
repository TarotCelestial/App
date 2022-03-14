import 'package:get/get.dart';
import 'package:tarotcelestial/repos/personalized_firebase_chat_core_repo.dart';
import 'package:tarotcelestial/widgets/custom_dialog.dart';
import '../../pages/chats/chat.dart';
import '../../repos/http_repo.dart';

class TarotistasController extends GetxController {
  var tarotistas;
  init() {
    HttpRepo().getTarotistas().then((data) {
      tarotistas = data;
      if (tarotistas == null) {
        return;
      }
      update();
    });
  }

  Future getUser(String email) async {
    Map filter = {"email": email};
    var user = await PersonalizedFirebaseChatCoreRepo.instance.findUser(filter);
    if (user.isEmpty) {
      return;
    }
    return user.first;
  }

  CreateRoom(String email, int userId, int tarotisId, String token) async {
    var response = await HttpRepo().createChat({"id": tarotisId}, userId, token);
    var user = await getUser(email);
    if (user == null || response == null) {
      Get.dialog(CustomDialog("Ah sucedido un error"));
      return;
    }
    final room =
        await PersonalizedFirebaseChatCoreRepo.instance.createRoom(user);
    Get.to(()=>
      ChatPage(
        room: room,
      ),
    );
  }
}
