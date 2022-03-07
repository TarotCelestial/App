import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ComplexPhone extends StatelessWidget {
  String country, code, number1, number2;
  ComplexPhone(this.country, this.code, this.number1, this.number2, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                country,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.hardPrincipal),
              ),
              const SizedBox(
                width: 30,
              ),
              Flag.fromString(code, height: 50, width: 40),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => _launchCaller(number1),
            child: Text(
              number1,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            "Pago por factura de teléfono:",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () => _launchCaller(number2),
            child: Text(
              number2,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            "precio 806: 1.21€/min red fija 1.57€/min red mvl. imp. incl. mayores de 18 años",
            style: TextStyle(fontSize: 10.5),
          ),
        ],
      ),
    );
  }

  _launchCaller(String number) async {
    String url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
