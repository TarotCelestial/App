import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tarotcelestial/data/models/hive_models/user_data.dart';
import 'package:tarotcelestial/data/models/personal_data_model.dart';
import 'package:tarotcelestial/pages/login/login_page.dart';
import 'package:tarotcelestial/providers/user_provider.dart';
import 'firebase_options.dart';
import 'pages/home/home_page.dart';
import 'pages/login/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
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
    final box = Hive.box<UserData>('UserData');
    Future.delayed(Duration.zero, () async {
      final userProviderReader = context.read<UserProvider>();
      if (isLoged) {
        try {
          userProviderReader
              .setUser(PersonalData.fromJson(box.getAt(0)!.personalData));
        } catch (_) {}
      }
    });
    //Gestion de sesión
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home-page',
      defaultTransition: Transition.leftToRight,
      //registro de rutas de la aplicación, las transitions son animaciones de cambio de pagina
      getPages: [
        GetPage(
            name: '/home-page',
            page: () => const HomePage(),
            transition: Transition.downToUp),
        GetPage(
            name: '/login-page',
            page: () => LoginPage(),
            transition: Transition.downToUp),
        GetPage(
            name: '/register-page',
            page: () => RegisterPage(),
            transition: Transition.downToUp)
      ],
    );
  }
}
