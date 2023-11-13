import 'package:appxor/src/Pages/xorView.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> rutas = {
    XorView.name: ((context) => const XorView()),
    
  };
}
