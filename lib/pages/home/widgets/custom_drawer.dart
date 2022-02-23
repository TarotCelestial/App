import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';

import '../../../controllers/home/home_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Drawer(
        child: Theme(
          data: ThemeData(accentColor: CustomColors.principal),
          child: ListView(
            children: [
              Container(
                color: CustomColors.principal.withOpacity(0.4),
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.asset("lib/assets/images/logo.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Tarot Celestial",
                            style: TextStyle(
                                color: CustomColors.hardPrincipal,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(1),
                            backgroundColor: MaterialStateProperty.all(
                                CustomColors.hardPrincipal)),
                        onPressed: () {
                          Get.toNamed("/login-page");
                        },
                        child: Container(
                          height: 40,
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
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: (){
                  _.changeSection(0);
                  Get.back();
                },
                leading: Icon(Icons.search,
                    color: _.index == 0
                        ? CustomColors.hardPrincipal
                        : CustomColors.black),
                title: const Text(
                  "Asesores",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                selected: _.index == 0,
                selectedColor: CustomColors.hardPrincipal,
              ),
              ListTile(
                onTap: (){
                  _.changeSection(2);
                  Get.back();
                },
                leading: Icon(Icons.chat_bubble_outline,
                    color: _.index == 2
                        ? CustomColors.hardPrincipal
                        : CustomColors.black),
                title: const Text(
                  "Chats",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                selected: _.index == 2,
                selectedColor: CustomColors.hardPrincipal,
              ),
              ListTile(
                onTap: (){
                  _.changeSection(3);
                  Get.back();
                },
                leading: Icon(FontAwesomeIcons.star,
                    color: _.index == 3
                        ? CustomColors.hardPrincipal
                        : CustomColors.black),
                title: const Text(
                  "Horóscopo",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                selected: _.index == 3,
                selectedColor: CustomColors.hardPrincipal,
              ),
              const Divider(color: Colors.black45,),
              ListTile(
                leading: Icon(Icons.settings,
                    color: CustomColors.black),
                title: const Text(
                  "Configuración",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info,
                        color: CustomColors.black),
                title: const Text(
                  "Sobre Tarot Celestial",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
