import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_todo_app/service/note.dart';
import 'package:hive_todo_app/utils/custom_button.dart';
import 'package:hive_todo_app/utils/custom_field.dart';
import 'package:hive_todo_app/utils/custom_text.dart';
import 'package:hive_todo_app/utils/spaces.dart';
import 'package:hive_todo_app/views/home/home_sreen.dart';

Future btmSheetUpdate(BuildContext context, String ttle, String des,
    Box<Note> hivebox, int index) {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  title.text = ttle;
  desc.text = des;
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                customTextWidget(
                    text: 'Update your note',
                    fontSize: 19,
                    fontWeight: FontWeight.w700),
                Spaces.mid,
                CustomTextField(
                    height: 50,
                    color: Colors.grey[200],
                    hintText: 'Enter title',
                    controller: title),
                Spaces.smallh,
                CustomTextField(
                    height: 50,
                    color: Colors.grey[200],
                    hintText: 'Enter description',
                    controller: desc),
                Spaces.smallh,
                Spaces.smallh,
                customElevatedBtnWidget(
                    bgColor: Colors.purple.shade800,
                    width: 298,
                    child: customTextWidget(
                        color: Colors.white,
                        text: 'Update',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                    func: () {
                      hivebox.putAt(
                          index, Note(title: title.text, desc: desc.text));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    }),
              ],
            ),
          ),
        ),
      );
    },
  );
}
