import 'dart:async';
import 'package:appxor/src/Pages/xorView.dart';
import 'package:appxor/src/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  //This Functions capture erorr (ZOne) erros sincronos
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    runApp(const MyApp());
  }, (Object error, StackTrace stack) async {});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromRGBO(5, 163, 157, 1),
      debugShowCheckedModeBanner: false,
      title: 'App XOR',
      initialRoute: XorView.name,
      routes: Routes.rutas,
    );
  }
}
