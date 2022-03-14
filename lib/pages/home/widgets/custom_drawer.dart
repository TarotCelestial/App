import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/pages/configuration/configuration_page.dart';

import '../../../controllers/home/home_controller.dart';
import '../../../providers/user_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return GetBuilder<HomeController>(builder: (_) {
      _.obtainSesion(userProvider);
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
                        height: 7,
                      ),
                      Obx(
                        () => _.isLoged.value
                            ? Container(
                                height: 50,
                                padding: const EdgeInsets.all(5),
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      userProvider.getUser!.personType == 1
                                          ? MainAxisAlignment.center
                                          : MainAxisAlignment.spaceAround,
                                  children: [
                                    userProvider.getUser!.personType == 1
                                        ? const SizedBox.shrink()
                                        : SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: userProvider
                                                    .getUser!.person!.user!
                                                    .getImagen(),
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: CustomColors
                                                              .hardPrincipal,
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                    Text(
                                      userProvider.getUser!.person!.user!
                                              .firstName! +
                                          " " +
                                          userProvider
                                              .getUser!.person!.user!.lastName!,
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              )
                            : ElevatedButton(
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(1),
                                    backgroundColor: MaterialStateProperty.all(
                                        CustomColors.hardPrincipal)),
                                onPressed: () {
                                  Get.toNamed("/login-page");
                                },
                                child: SizedBox(
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
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  _.changeSection(0);
                  Get.back();
                },
                leading: Icon(Icons.search,
                    color: _.index == 0
                        ? CustomColors.hardPrincipal
                        : CustomColors.black),
                title: const Text(
                  "Tarotistas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                selected: _.index == 0,
                selectedColor: CustomColors.hardPrincipal,
              ),
              ListTile(
                onTap: () {
                  if (userProvider.getUser?.personType == 2) {
                    _.changeSection(0);
                  } else {
                    _.changeSection(2);
                  }
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
                onTap: () {
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
              const Divider(
                color: Colors.black45,
              ),
              userProvider.getUser!.personType == 2
                  ? ListTile(
                      onTap: () {
                        Get.to(() => ConfigurationPage());
                      },
                      leading: Icon(Icons.settings, color: CustomColors.black),
                      title: const Text(
                        "Configuración",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  : const SizedBox.shrink(),
              ListTile(
                leading: Icon(Icons.info, color: CustomColors.black),
                title: const Text(
                  "Sobre Tarot Celestial",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              userProvider.getUser?.personType == null
                  ? const SizedBox.shrink()
                  : ListTile(
                      leading: Icon(Icons.logout, color: CustomColors.black),
                      title: const Text(
                        "Cerrar sesión",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        _.closeSesion(userProvider);
                        Get.offAllNamed('/home-page');
                      },
                    ),
            ],
          ),
        ),
      );
    });
  }
}
