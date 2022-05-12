import 'package:flutter_svg/svg.dart';
import 'package:tarotcelestial/data/models/zodiac_sign_model.dart';

class Constants {
  static List zodiacSigns = [
    ZodiacSign("Aries", "marzo 21 - abril 19", "lib/assets/signs/aries.svg"),
    ZodiacSign("Tauro", "abril 20 - mayo 20", "lib/assets/signs/tauro.svg"),
    ZodiacSign("Geminis", "mayo 21 - junio 20", "lib/assets/signs/geminis.svg"),
    ZodiacSign("Cáncer", "junio 21 - julio 22", "lib/assets/signs/cancer.svg"),
    ZodiacSign("Leo", "julio 23 - agosto 22", "lib/assets/signs/leo.svg"),
    ZodiacSign(
        "Virgo", "agosto 23 - septiembre 22", "lib/assets/signs/virgo.svg"),
    ZodiacSign(
        "Libra", "septiembre 23 - octubre 22", "lib/assets/signs/libra.svg"),
    ZodiacSign("Escorpio", "octubre 23 - noviembre 21",
        "lib/assets/signs/escorpio.svg"),
    ZodiacSign("Sagitario", "noviembre 22 - diciembre 21",
        "lib/assets/signs/sagitario.svg"),
    ZodiacSign("Capricornio", "diciembre 22 - enero 19",
        "lib/assets/signs/capricornio.svg"),
    ZodiacSign(
        "Acuario", "enero 20 - febrero 18", "lib/assets/signs/acuario.svg"),
    ZodiacSign(
        "Piscis", "febrero 19 - marzo 20", "lib/assets/signs/piscis.svg"),
  ];

  static List countries = [
    "España",
    "Estados Unidos",
    "Puerto Rico",
    "Argentina",
    "República Dominicana",
    "Panamá",
    "México",
    "Otro",
  ];
}
