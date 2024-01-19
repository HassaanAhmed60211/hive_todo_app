import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_todo_app/service/note.dart';
import 'package:hive_todo_app/utils/background_widget.dart';
import 'package:hive_todo_app/utils/custom_field.dart';
import 'package:hive_todo_app/utils/custom_text.dart';
import 'package:hive_todo_app/utils/spaces.dart';
import 'package:hive_todo_app/views/read/widgets/btmsheet_update.dart';
import 'package:hive_todo_app/views/read/widgets/search__provider.dart';

// ignore: must_be_immutable
class ReadPage extends HookConsumerWidget {
  ReadPage({super.key});
  late Box<Note> hivebox;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rRead = ref.read(searchProvider);
    final rWatch = ref.watch(searchProvider);

    useEffect(() {
      hivebox = Hive.box<Note>('notebox');
      rRead.noteData = hivebox.values.toList();
      return null;
    });
    return BackgroundWid(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            CustomTextField(
                onChanged: (value) {
                  rRead.searchData(value);
                },
                prefixIcon: const Icon(Icons.search),
                height: 50,
                color: const Color(0xFFCBC1FD),
                hintText: 'Search Note',
                controller: rRead.search),
            Spaces.smallh,
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            hivebox.isEmpty
                ? SizedBox(
                    height: 500,
                    child: Center(
                      child: customTextWidget(
                          text: 'no note available', color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: rWatch.searhData.isEmpty
                        ? hivebox.length
                        : rRead.searhData.length,
                    itemBuilder: (context, index) {
                      Note item = rWatch.searhData.isEmpty
                          ? hivebox.getAt(index)!
                          : rRead.searhData[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7E63FF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.68,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      customTextWidget(
                                          text: item.title,
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                      Spaces.smallh,
                                      customTextWidget(
                                          text: item.desc,
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        hivebox.deleteAt(index);
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Spaces.smallh,
                                    GestureDetector(
                                      onTap: () {
                                        btmSheetUpdate(context, item.title,
                                            item.desc, hivebox, index);
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    ));
  }
}
