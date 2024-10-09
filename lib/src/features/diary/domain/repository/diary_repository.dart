import 'dart:io';

import 'package:diary/src/features/diary/domain/entities/diary.dart';

abstract class DiaryRepository {
  Future<void> addDiary({
    required String title,
    required String content,
    String? tag,
    File? image,
  });

  Stream<List<Diary>> watchDiaries();
}
