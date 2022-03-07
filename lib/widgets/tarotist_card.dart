import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sections/tarotistas_controller.dart';
import '../pages/tarot/tarotist_info_page.dart';

class TarotistCard extends StatelessWidget {
  TarotistasController controller;
  int index;

  TarotistCard(this.controller, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(TarotistInfoPage(controller, index));
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.network(controller.tarotistas[index]["user"]["imagen"],),
                ),
              ),
              Text(
                controller.tarotistas[index]["nombreArtistico"],
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                controller.tarotistas[index]["especialidades"][0]["nombre"],
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
