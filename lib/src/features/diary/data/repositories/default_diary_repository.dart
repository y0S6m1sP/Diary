import 'package:diary/src/features/diary/data/datasources/diary_data_source.dart';
import 'package:diary/src/features/diary/domain/entities/diary.dart';
import 'package:diary/src/features/diary/domain/mappers/mappers.dart';
import 'package:diary/src/features/diary/domain/repositories/diary_repository.dart';
import 'package:diary/src/features/diary/domain/usecases/add_diary_usecase.dart';

class DefaultDiaryRepository extends DiaryRepository {
  DefaultDiaryRepository({
    required this.diaryDataSource,
  });

  final DiaryDataSource diaryDataSource;

  @override
  Future<void> addDiary(AddDiaryParams params) async {
    diaryDataSource.addDiary(params);
  }

  @override
  Stream<List<Diary>> watchDiaries() {
    return diaryDataSource.watchDiaries().map((diaries) {
      return diaries.map((diary) {
        return diary.toDomain();
      }).toList();
    });
  }
}
