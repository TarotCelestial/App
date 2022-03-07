import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/controllers/auth/auth_controller.dart';
import 'package:tarotcelestial/data/constants/constants.dart';
import 'package:tarotcelestial/data/models/zodiac_sign_model.dart';

import '../../providers/user_provider.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController nombres = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.hardPrincipal,
          title: const Text(
            "Registrarse",
          ),
        ),
        body: GetBuilder<AuthController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
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
                                            color: CustomColors.hardPrincipal),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: nombres,
                                      cursorColor: CustomColors.hardPrincipal,
                                      decoration: const InputDecoration(
                                          hintText: "Nombres",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: CustomColors.hardPrincipal),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: apellidos,
                                      cursorColor: CustomColors.hardPrincipal,
                                      decoration: const InputDecoration(
                                          hintText: "Apellidos",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: CustomColors.hardPrincipal),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: email,
                                      cursorColor: CustomColors.hardPrincipal,
                                      decoration: const InputDecoration(
                                          hintText: "Correo",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: CustomColors.hardPrincipal),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Signo",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: DropdownButton<ZodiacSign>(
                                            value: _.dropSignIndex,
                                            icon: const Icon(
                                                Icons.arrow_drop_down),
                                            elevation: 16,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                            underline: const SizedBox.shrink(),
                                            onChanged: (ZodiacSign? newValue) {
                                              _.changeSingIndex(newValue!);
                                            },
                                            items: _.signs.map<
                                                    DropdownMenuItem<
                                                        ZodiacSign>>(
                                                (dynamic value) {
                                              return DropdownMenuItem<
                                                  ZodiacSign>(
                                                value: value,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(value.name),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: CustomColors.hardPrincipal),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "País",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: DropdownButton<String>(
                                            value: _.dropCountryIndex,
                                            icon: const Icon(
                                                Icons.arrow_drop_down),
                                            elevation: 16,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                            underline: const SizedBox.shrink(),
                                            onChanged: (String? newValue) {
                                              _.changeCountryIndex(newValue!);
                                            },
                                            items: _.countries
                                                .map<DropdownMenuItem<String>>(
                                              (dynamic value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                      value,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: CustomColors.hardPrincipal),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: password,
                                      cursorColor: CustomColors.hardPrincipal,
                                      decoration: const InputDecoration(
                                          hintText: "Contraseña",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      controller: password2,
                                      cursorColor: CustomColors.hardPrincipal,
                                      decoration: const InputDecoration(
                                          hintText: "Contraseña nuevamente",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              onPressed: () => _.register(
                                  email.text,
                                  password.text,
                                  password2.text,
                                  nombres.text,
                                  apellidos.text,
                                  userProvider),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      CustomColors.hardPrincipal)),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Regístrate",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: Get.width * 0.7,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Al continuar, aceptas nuestros',
                                  style: const TextStyle(color: Colors.grey),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Términos de servicio',
                                        style: const TextStyle(
                                            color: CustomColors.hardPrincipal,
                                            fontWeight: FontWeight.bold),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // navigate to desired screen
                                          }),
                                    const TextSpan(
                                      text: ' y la',
                                    ),
                                    TextSpan(
                                        text: ' Política de privacidad',
                                        style: const TextStyle(
                                            color: CustomColors.hardPrincipal,
                                            fontWeight: FontWeight.bold),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // navigate to desired screen
                                          }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
