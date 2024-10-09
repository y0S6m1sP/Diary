import 'package:diary/src/features/diary/domain/entities/diary.dart';
import 'package:diary/src/features/diary/domain/usecases/add_diary_usecase.dart';

abstract class DiaryRepository {
  Future<void> addDiary(AddDiaryParams params);

  Stream<List<Diary>> watchDiaries();
}
