import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../repos/personalized_firebase_chat_core_repo.dart';

class RoomsController extends GetxController {
  bool loading = true;
  List<types.TextMessage> messages = [];
  init(rooms) {
    rooms.forEach((room) {
      PersonalizedFirebaseChatCoreRepo.instance.getLastMessage(room).then((message) {
        messages.add(message as types.TextMessage);
        if(room == rooms.last) {
          loading = false;
          update();
        }
      });
    });
  }

}