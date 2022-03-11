import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/controllers/sections/horoscopo_controller.dart';

class HoroscopoRead extends StatelessWidget {
  const HoroscopoRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final nowString = now.day.toString() +
        "-" +
        now.month.toString() +
        "-" +
        now.year.toString();
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hoy",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(nowString,
              style: const TextStyle(fontSize: 14, color: Colors.black38)),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<HoroscopoController>(
              builder: (_){
                return Obx(() {
                  if(_.Horoscope.value.isEmpty){
                    return const Center(child: CircularProgressIndicator(color: CustomColors.hardPrincipal,),);
                  }
                  return Text(
                    _.signHoroscope(),
                    style: const TextStyle(fontSize: 15.5, color: Colors.black54),
                  );
                });
          }),

        ],
      ),
    );
  }
}
