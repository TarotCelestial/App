import 'package:flutter/material.dart';
import 'package:tarotcelestial/pages/phones/widgets/complex_phone.dart';
import 'package:tarotcelestial/pages/phones/widgets/simple_phone.dart';

import '../../assets/custom-colors.dart';

class PhonesPage extends StatelessWidget {
  const PhonesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.hardPrincipal,
        title: const Text("Teléfonos"),
      ),
      backgroundColor: CustomColors.principal,
      body: Theme(
        data: ThemeData(accentColor: CustomColors.principal),
        child: ListView(
          children: [
            ComplexPhone("España", "ES", "+34930502586", "+34806430135"),
            const Divider(
              color: Colors.black,
            ),
            SimplePhone("Estados Unidos", "US", "+17865394750"),
            const Divider(
              color: Colors.black,
            ),
            SimplePhone("Puerto Rico", "pr", "+17865394750"),
            const Divider(
              color: Colors.black,
            ),
            SimplePhone("Argentina", "AR", "+541152362300"),
            const Divider(
              color: Colors.black,
            ),
            SimplePhone("Rep. Dominicana", "DO", "+18299548005"),
            const Divider(
              color: Colors.black,
            ),
            SimplePhone("Panamá", "PA", "+5078337604"),
            const Divider(
              color: Colors.black,
            ),
            SimplePhone("México", "MX", "+525541697009"),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
