import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/controllers/auth/auth_controller.dart';

import '../../providers/user_provider.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.hardPrincipal,
        title: const Text("Configuración"),
      ),
      body: GetBuilder<AuthController>(
        init: authController,
        builder: (_) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 130,
                  width: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: CachedNetworkImage(
                      imageUrl: userProvider.getUser!.person!.user!.getImagen(),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            color: CustomColors.hardPrincipal,
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors.hardPrincipal)),
                  onPressed: () {
                    _.changeImage(userProvider);
                  },
                  child: const Text(
                    "Cambiar Foto",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                //a switch for online status
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: SwitchListTile(
                    //Stilize the switch
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.red,
                    activeTrackColor: Colors.green,
                    title: Row(
                      children: [
                        //Text for the switch, very stilized
                        const Text("Estado",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          userProvider.getUser!.person!.user!.online!
                              ? "Online"
                              : "Offline",
                          style: TextStyle(
                            color: userProvider.getUser!.person!.user!.online!
                                ? Colors.green
                                : Colors.red,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    value: userProvider.getUser!.person?.user!.online ?? false,
                    onChanged: (value) {
                      _.changeOnlineStatus(userProvider);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
