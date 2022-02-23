import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tarotcelestial/pages/login/login_page.dart';

import 'pages/home/home_page.dart';
import 'pages/login/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  final prefs = await SharedPreferences.getInstance();
  final isLoged = prefs.getBool('isLoged') ?? false;
  final user = prefs.getString('user') ?? "";
  final permissions = prefs.getString('permissions') ?? "";
  final company = prefs.getString('company') ?? "";
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  /*runApp(MultiProvider(
    providers: [/*ChangeNotifierProvider(create: (_) => UserProvider())*/],
    child: MyApp(isLoged,user),*/
  runApp(MyApp(isLoged,user));
}

class MyApp extends StatelessWidget {
  String user;
  bool isLoged;
  MyApp(this.isLoged,this.user); // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    String initialRoute;
    Future.delayed(Duration.zero, () async {
      /*final userProviderReader = context.read<UserProvider>();
      if(isLoged){
        userProviderReader.changePermissions(jsonDecode(permissions));
        userProviderReader.changeCurrentUser(UserModel.fromMap(jsonDecode(user)));
        userProviderReader.changeCurrentCompany(CompanyModel.fromMap(jsonDecode(company)));
      }*/
    });
    //Gestion de sesión
    if(isLoged){
      initialRoute='/control-home-page';
    }else{
      initialRoute='/login';
    }
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home-page',
      //initialRoute: '/control-home-page',
      defaultTransition: Transition.leftToRight,
      //registro de rutas de la aplicación, las transitions son animaciones de cambio de pagina
      getPages: [
        GetPage (name: '/home-page', page: () => const HomePage(),transition: Transition.downToUp),
        GetPage(name: '/login-page', page: () => const LoginPage(),transition: Transition.downToUp),
        GetPage(name: '/register-page', page: () => const RegisterPage(),transition: Transition.downToUp)


        /*GetPage(name: '/home', page: () => Homepage()),
        GetPage(name: '/interest', page: () => InterestAreaPage()),
        GetPage(name: '/product-list', page: () => ProductsListPage()),
        GetPage(name: '/product-info', page: () => ProductInfoPage()),*/

      ],
    );
  }
}