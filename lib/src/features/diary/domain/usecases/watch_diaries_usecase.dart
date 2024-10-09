import 'package:diary/src/features/diary/domain/entities/diary.dart';
import 'package:diary/src/features/diary/domain/repositories/diary_repository.dart';

class WatchDiariesUsecase {
  WatchDiariesUsecase({required this.repository});

  final DiaryRepository repository;

  Stream<List<Diary>> call() {
    return repository.watchDiaries();
  }
}