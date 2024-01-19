import 'package:flutter/material.dart';
import 'package:hive_todo_app/utils/background_widget.dart';
import 'package:hive_todo_app/utils/custom_button.dart';
import 'package:hive_todo_app/utils/custom_text.dart';
import 'package:hive_todo_app/utils/spaces.dart';
import 'package:hive_todo_app/views/home/home_sreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWid(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/ontime.png',
          height: 100,
        ),
        Spaces.large,
        Spaces.large,
        Spaces.large,
        SizedBox(
          width: 235,
          child: customTextWidget(
              textAlign: TextAlign.center,
              text: 'Make yourself more on time',
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
        Spaces.large,
        Spaces.large,
        Spaces.large,
        Spaces.large,
        customElevatedBtnWidget(
            width: 298,
            child: customTextWidget(
                text: 'START', fontSize: 24, fontWeight: FontWeight.w700),
            func: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            }),
      ],
    ));
  }
}
