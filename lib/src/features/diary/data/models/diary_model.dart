import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/src/features/diary/domain/entities/diary.dart';

class DiaryModel extends Diary {
  const DiaryModel({
    required super.id,
    required super.title,
    required super.content,
    required super.createdAt,
    required super.image,
    required super.tag,
  });

  factory DiaryModel.fromMap(Map<String, dynamic> map, String id) {
    return DiaryModel(
      id: id,
      title: map['title'],
      content: map['content'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      image: map['image'] ?? '',
      tag: map['tag'] ?? 'all',
    );
  }
}