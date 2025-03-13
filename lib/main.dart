import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/app.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(const MyApp());
}
