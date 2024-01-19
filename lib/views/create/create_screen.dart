import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_todo_app/service/note.dart';
import 'package:hive_todo_app/utils/background_widget.dart';
import 'package:hive_todo_app/utils/custom_button.dart';
import 'package:hive_todo_app/utils/custom_field.dart';
import 'package:hive_todo_app/utils/custom_text.dart';
import 'package:hive_todo_app/utils/spaces.dart';
import 'package:hive_todo_app/views/home/home_sreen.dart';

// ignore: must_be_immutable
class CreatePage extends HookWidget {
  CreatePage({super.key});
  late Box<Note> hivebox;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      hivebox = Hive.box<Note>('notebox');
      return null;
    });
    return BackgroundWid(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spaces.large,
              Spaces.large,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Spaces.largew,
                  Spaces.largew,
                  Spaces.largew,
                  Image.asset(
                    'assets/ontime.png',
                    height: 18,
                  ),
                ],
              ),
              Spaces.mid,
              Spaces.large,
              Spaces.large,
              Spaces.large,
              Spaces.large,
              CustomTextField(
                  height: 50,
                  color: const Color(0xFFCBC1FD),
                  hintText: 'Enter title',
                  controller: title),
              Spaces.smallh,
              CustomTextField(
                  height: 50,
                  color: const Color(0xFFCBC1FD),
                  hintText: 'Enter description',
                  controller: desc),
              Spaces.smallh,
              Spaces.smallh,
              customElevatedBtnWidget(
                  width: 298,
                  child: customTextWidget(
                      text: 'Create',
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                  func: () {
                    hivebox.add(Note(title: title.text, desc: desc.text));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  }),
            ],
          )),
    );
  }
}
