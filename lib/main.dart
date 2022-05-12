import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tarotcelestial/data/models/hive_models/user_data.dart';
import 'package:tarotcelestial/data/models/personal_data_model.dart';
import 'package:tarotcelestial/pages/home/tarotist-home-page.dart';
import 'package:tarotcelestial/pages/login/login_page.dart';
import 'package:tarotcelestial/providers/user_provider.dart';
import 'firebase_options.dart';
import 'pages/home/admin-home-page.dart';
import 'pages/home/home_page.dart';
import 'pages/login/register_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    Stripe.publishableKey = "pk_test_51JaCR8BZH9IUwfrAmLYf4kqjD2RF1nOgAaynwUWyuEs5RQ9d2PXlq9ZJwAY9pLqcxDPpaqvCCfSR0h1skGoRL24l00oMxCjV7R";
    Stripe.merchantIdentifier = 'test';
    Stripe.urlScheme = 'flutterstripe';
    await Stripe.instance.applySettings();
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );
  await dotenv.load(fileName: "dotenv");
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
  await Hive.openBox<UserData>('UserData');
  final prefs = await SharedPreferences.getInstance();
  final isLoged = prefs.getBool('isLoged') ?? false;
  final user = prefs.getString('user') ?? "";
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MyApp(isLoged, user),
    ),
  );
}

class MyApp extends StatelessWidget {
  String user;
  bool isLoged;
  MyApp(this.isLoged, this.user); // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    String initialRoute='/home-page';
    final box = Hive.box<UserData>('UserData');
    final userProviderReader = context.read<UserProvider>();
    if (isLoged) {
      try {
        userProviderReader
            .setUser(PersonalData.fromJson(box.getAt(0)!.personalData));
        if(box.getAt(0)!.personalData["personType"]==2){
          initialRoute='/tarotist-home-page';
        }
        if(box.getAt(0)!.personalData["personType"]==0){
          initialRoute='/admin-home-page';
        }
      } catch (_) {
      }
    }
    //Gestion de sesión
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
      defaultTransition: Transition.leftToRight,
      //registro de rutas de la aplicación, las transitions son animaciones de cambio de pagina
      getPages: [
        GetPage(
            name: '/home-page',
            page: () => const HomePage()),
        GetPage(
            name: '/tarotist-home-page',
            page: () => const TarotistHomePage(),
            transition: Transition.downToUp),
        GetPage(
            name: '/admin-home-page',
            page: () => const AdminHomePage(),
            transition: Transition.downToUp),
        GetPage(
            name: '/login-page',
            page: () => LoginPage(),
            transition: Transition.downToUp),
        GetPage(
            name: '/register-page',
            page: () => RegisterPage(),
            transition: Transition.downToUp),

      ],
    );
  }
}
