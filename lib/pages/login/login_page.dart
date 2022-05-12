import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/controllers/auth/auth_controller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../providers/user_provider.dart';

class LoginPage extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showPassword = false;
  final authController = Get.put(AuthController());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.hardPrincipal,
        title: const Text(
          "Iniciar sesión",
        ),
      ),
      body: GetBuilder<AuthController>(
          init: authController,
          builder: (_) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: kIsWeb ? 700 : Get.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: Theme(
                        data: ThemeData(accentColor: CustomColors.principal),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 60,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColors.hardPrincipal),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: CustomColors.hardPrincipal,
                                        blurRadius: 12,
                                        offset: Offset(8, 8),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    CustomColors.hardPrincipal),
                                          ),
                                        ),
                                        child: TextField(
                                          cursorColor:
                                              CustomColors.hardPrincipal,
                                          controller: email,
                                          decoration: const InputDecoration(
                                              hintText: "Correo",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                          cursorColor:
                                              CustomColors.hardPrincipal,
                                          controller: password,
                                          obscureText: _.showPassword,
                                          decoration: InputDecoration(
                                            hintText: "Contraseña",
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            border: InputBorder.none,
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                _.invertShowPassword();
                                              },
                                              icon: Icon(
                                                _.showPassword
                                                    ? FontAwesomeIcons.eye
                                                    : FontAwesomeIcons.eyeSlash,
                                                color:
                                                    CustomColors.hardPrincipal,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                /*const Text(
                            "¿Olvidaste tu contraseña?",
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                          ),*/
                                const SizedBox(
                                  height: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () => _.login(
                                      email.text, password.text, userProvider),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              CustomColors.hardPrincipal)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(11.0),
                                    child: Text(
                                      "Ingresar",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "¿No tienes una cuenta? ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed("/register-page");
                                      },
                                      child: const Text(
                                        "Regístrate",
                                        style: TextStyle(
                                            color: CustomColors.hardPrincipal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
