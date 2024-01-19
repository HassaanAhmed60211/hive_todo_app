import 'package:flutter/material.dart';
import 'package:hive_todo_app/utils/background_widget.dart';
import 'package:hive_todo_app/utils/custom_button.dart';
import 'package:hive_todo_app/utils/custom_text.dart';
import 'package:hive_todo_app/utils/spaces.dart';
import 'package:hive_todo_app/views/create/create_screen.dart';
import 'package:hive_todo_app/views/read/read_screen.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWid(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spaces.large,
              Spaces.large,
              Image.asset(
                'assets/ontime.png',
                height: 18,
              ),
              Spaces.mid,
              Spaces.large,
              Spaces.large,
              Spaces.large,
              Spaces.large,
              Spaces.large,
              Spaces.large,
              customElevatedBtnWidget(
                  width: 298,
                  child: customTextWidget(
                      text: 'Create',
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                  func: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatePage(),
                        ));
                  }),
              Spaces.large,
              customElevatedBtnWidget(
                  width: 298,
                  child: customTextWidget(
                      text: 'Read', fontSize: 24, fontWeight: FontWeight.w700),
                  func: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadPage(),
                        ));
                  }),
            ],
          )),
    );
  }
}
