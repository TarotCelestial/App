import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/pages/chats/rooms.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../assets/custom-colors.dart';
import '../../controllers/home/home_controller.dart';
import '../../providers/user_provider.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return GetBuilder<HomeController>(builder: (_) {
      _.obtainSesion(userProvider);
      return Obx(
        () => _.isLoged.value
            ? RoomsPage()
            : Padding(
                padding: const EdgeInsets.all(100.0),
                child: Column(
                  children: [
                    Text(
                      "Inicia sesión para chatear",
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
}
