import 'package:flutter/material.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';

class AdviserPerk extends StatelessWidget {
  String perk;

  AdviserPerk(this.perk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 12, 8),
      child: Container(
        padding: const EdgeInsets.only(left: 15,right: 15, bottom: 8,top: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: CustomColors.hardPrincipal,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20),),),
        child: Text(
          perk, style: const TextStyle(color: CustomColors.hardPrincipal, fontSize: 14.5, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
