import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive_todo_app/utils/background_widget.dart';
import 'package:hive_todo_app/views/welcome/welcome_screen.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ));
      });
      return null;
    });
    return BackgroundWid(
      child: Center(
        child: Image.asset(
          'assets/ontime.png',
          height: 80,
        ),
      ),
    );
  }
}
