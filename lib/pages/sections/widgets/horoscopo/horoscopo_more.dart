import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/widgets/tarotist_card.dart';

import '../../../../assets/custom-colors.dart';
import '../../../../controllers/sections/tarotistas_controller.dart';
import '../../../tarotist/tarotist_info_page.dart';

class HoroscopoMore extends StatelessWidget {
  const HoroscopoMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width / 1.7,
            child: const Text(
              "¿Necesitas asesoramiento o una predicción personal?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Habla con uno de nuestros expertos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 170,
            child: GetBuilder<TarotistasController>(
                builder: (_) {
                  if (_.tarotistas == null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: CustomColors.hardPrincipal,
                      ),
                    );
                  }
                  if (_.tarotistas.isEmpty) {
                    return const Center(
                      child: Text("No hay datos para mostrar"),
                    );
                  }
                  return Theme(
                    data: ThemeData(accentColor: CustomColors.principal),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _.tarotistas.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.to(TarotistInfoPage(index));
                          },
                          child: TarotistCard(index),
                        );
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
