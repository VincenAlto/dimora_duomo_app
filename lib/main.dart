import 'package:dimora_duomo/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controllers/controllers.dart';
import 'views/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(MenuController(), permanent: true);
  Get.put(InputController());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroundColor,
          //systemOverlayStyle: SystemUiOverlayStyle.dark,
          //titleTextStyle: const TextStyle(color: kPrimaryColor, fontSize: 24),
          shadowColor: Colors.grey[600],
          elevation: 0, //size of AppBar shadow
        ),
      ),
      home: const LoginPage(),
    );
  }
}
