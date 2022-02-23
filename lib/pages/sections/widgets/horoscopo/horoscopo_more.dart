import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/widgets/adviser_card.dart';

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                AdviserCard(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
                    "Scarlett",
                    "Amor"),
                AdviserCard(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
                    "Scarlett",
                    "Amor"),
                AdviserCard(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
                    "Scarlett",
                    "Amor"),
                AdviserCard(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
                    "Scarlett",
                    "Amor"),
                AdviserCard(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
                    "Scarlett",
                    "Amor"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
