import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';

import '../../controllers/sections/cargar_controller.dart';

class CargarPage extends StatelessWidget {
  CargarController cargarController = Get.put(CargarController());
  CargarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CargarController>(
      init: cargarController,
      builder: (_) {
        _.init();
        if (_.available == false) {
          const Center(
            child: CircularProgressIndicator(
              backgroundColor: CustomColors.hardPrincipal,
            ),
          );
        }
        return Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SizedBox.shrink(),
                  Text(
                    "Pago 100% seguro con google play",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Icon(FontAwesomeIcons.googlePlay, color: Colors.grey),
                  SizedBox.shrink()
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
                    child: InkWell(
                      onTap: () => _.setIndex(index),
                      child: Container(
                        width: Get.width,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: _.getIndex() == index
                                    ? CustomColors.hardPrincipal
                                    : Colors.grey),
                            color: _.getIndex() == index
                                ? CustomColors.hardPrincipal.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _.text[index],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _.getIndex() == index
                                      ? CustomColors.hardPrincipal
                                      : Colors.black87),
                            ),
                            Text(
                              "\$${_.value[index]}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: _.getIndex() == index
                                      ? CustomColors.hardPrincipal
                                      : Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(CustomColors.hardPrincipal),
                ),
                onPressed: () {},
                child: SizedBox(
                  width: Get.width,
                  height: 50,
                  child: Center(
                      child: Text(
                    "Paga \$${_.value[_.getIndex()]}",
                    style: const TextStyle(fontSize: 20),
                  )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
