import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getx_pattern_demo/main/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZoned(() {
    runApp(
        App()
    );
  });
  // entry point for the app
}
