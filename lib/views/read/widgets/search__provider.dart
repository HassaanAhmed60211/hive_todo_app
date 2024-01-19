import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_todo_app/service/note.dart';

final searchProvider =
    ChangeNotifierProvider<SearchProvider>((ref) => SearchProvider());

class SearchProvider extends ChangeNotifier {
  List<Note> noteData = [];
  List<Note> searhData = [];
  TextEditingController search = TextEditingController();

  void searchData(String val) {
    searhData.clear();
    if (search.text.isNotEmpty) {
      for (var e in noteData) {
        if (e.title.contains(val)) {
          searhData.add(e);
        }
      }
    } else {
      searhData.clear();
    }
    notifyListeners();
  }
}
