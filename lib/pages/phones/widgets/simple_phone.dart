import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SimplePhone extends StatelessWidget {
  String country, code, number;
  SimplePhone(this.country, this.code, this.number, {Key? key})
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
              onTap: ()=>_launchCaller(),
              child: Text(
                number,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
              )),
        ],
      ),
    );
  }

  _launchCaller() async {
    String url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
