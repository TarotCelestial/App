import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/data/constants/constants.dart';

import '../../../../controllers/sections/horoscopo_controller.dart';

class HoroscopoSignSelector extends StatelessWidget {
  final horoscopoController = Get.put(HoroscopoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HoroscopoController>(
        initState: horoscopoController.init(),
        init: horoscopoController,
        builder: (_) {
          return SizedBox(
            height: 180,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 15, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Cumpleaños: ${Constants.zodiacSigns[_.index].birthRange}",
                      style:
                          const TextStyle(fontSize: 17, color: Colors.black38)),
                  Text(
                    Constants.zodiacSigns[_.index].name,
                    style: const TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Constants.zodiacSigns.length,
                      itemBuilder: (context, index) {
                        return InkResponse(
                          onTap: () {
                            _.changeSelected(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 55,
                              decoration: BoxDecoration(
                                color: _.index == index
                                    ? CustomColors.hardPrincipal
                                    : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.5),
                                child: SvgPicture.asset(
                                  Constants
                                      .zodiacSigns[index].iconPath,
                                  color: _.index == index
                                      ? Colors.white
                                      : CustomColors.hardPrincipal,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
