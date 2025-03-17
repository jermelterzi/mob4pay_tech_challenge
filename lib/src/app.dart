import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/ui/theme/text_theme.dart';
import 'package:mob4pay_tech_challenge/src/ui/theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();

    _router = getIt<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final textTheme = const GoogleFontsTextTheme().createTextTheme(context);
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: 'Mob4Pay Tech Challenge',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: _router.config(),
    );
  }
}
