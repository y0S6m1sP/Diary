import 'dart:io';

import 'package:diary/data/model/diary.dart';

abstract class DiaryRepository {
  Future<void> addDiary({
    required String title,
    required String content,
    String? tag,
    File? image,
  });

  Stream<List<Diary>> watchDiaries();
}
