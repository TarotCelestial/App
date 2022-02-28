import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/pages/advisers/widgets/advisers_top_info.dart';

import '../../controllers/sections/tarotistas_controller.dart';

class TarotistasPage extends StatelessWidget {
  final tarotistasController = Get.put(TarotistasController());
  TarotistasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TarotistasController>(
        init: tarotistasController,
        initState: tarotistasController.init(),
        builder: (_) {
          return ListView(
            children: [
              AdvisersTopInfo(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
                "Scarlett",
                "Amor",
              ),
              const Divider(
                color: Colors.black12,
                thickness: 6,
              ),
              AdvisersTopInfo(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
                "Scarlett",
                "Amor",
              ),
              const Divider(
                color: Colors.black12,
                thickness: 6,
              ),
              AdvisersTopInfo(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
                "Scarlett",
                "Amor",
              ),
            ],
          );
        });
  }
}
