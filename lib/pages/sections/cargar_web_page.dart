import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../controllers/home/home_controller.dart';
import '../../controllers/sections/cargar_controller.dart';
import '../../providers/user_provider.dart';

class CargarWebPage extends StatelessWidget {
  CargarController cargarController = Get.put(CargarController());

  CargarWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return GetBuilder<HomeController>(builder: (_) {
      _.obtainSesion(userProvider);
      return Obx(
        () => _.isLoged.value
            ? cargar(userProvider)
            : Padding(
                padding: const EdgeInsets.all(100.0),
                child: Column(
                  children: [
                    Text(
                      "Inicia sesión para cargar",
                      style: TextStyle(
                          color: CustomColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(1),
                            backgroundColor: MaterialStateProperty.all(
                                CustomColors.hardPrincipal)),
                        onPressed: () {
                          Get.toNamed("/login-page");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: kIsWeb
                              ? Text(
                                  "Iniciar sesión",
                                  style: TextStyle(
                                      color: CustomColors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Iniciar sesión",
                                      style: TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }

  Widget cargar(UserProvider userProvider) {
    return GetBuilder<CargarController>(
      init: cargarController,
      builder: (_) {
        _.initWeb(userProvider);
        if (_.loading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: CustomColors.hardPrincipal,
            ),
          );
        }
        return Column(
          children: [
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        "Pago 100% seguro por medio de ",
                        style: TextStyle(fontSize: 22, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.ccStripe,
                      size: 38,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 2,
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
                              "_.products[index].description",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _.getIndex() == index
                                      ? CustomColors.hardPrincipal
                                      : Colors.black87),
                            ),
                            Text(
                              "_.products[index].price",
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
                onPressed: () => _.buy(),
                child: SizedBox(
                  width: Get.width,
                  height: 50,
                  child: Center(
                      child: Text(
                    "Paga {_.products[_.getIndex()].price}",
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
