import 'package:diary/src/features/diary/data/models/diary_model.dart';
import 'package:diary/src/features/diary/domain/entities/diary.dart';

extension DiaryModelExtension on DiaryModel {
  Diary toDomain() => Diary(
        id: id,
        title: title,
        content: content,
        createdAt: createdAt,
        image: image,
        tag: tag,
      );
}
