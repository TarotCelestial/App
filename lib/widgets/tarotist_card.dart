import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sections/tarotistas_controller.dart';
import '../pages/tarotist/tarotist_info_page.dart';

class TarotistCard extends StatelessWidget {
  int index;

  TarotistCard(this.index);

  @override
  Widget build(BuildContext context) {
    TarotistasController controller = Get.find<TarotistasController>();
    return InkWell(
      onTap: () {
        Get.to(()=>TarotistInfoPage(index));
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
                  child: SizedBox(
                    height: 85,
                      width: 85,
                      child: Image.network(
                    controller.tarotistas[index]["user"]["imagen"],
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Text(
                controller.tarotistas[index]["nombre_artistico"],
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
