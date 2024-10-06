import 'dart:io';

abstract class DiaryRepository {
  Future<void> addDiary({
    required String title,
    required String content,
    File? image,
  });
}
