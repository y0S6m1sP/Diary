import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/src/features/diary/domain/repositories/diary_repository.dart';
import 'package:equatable/equatable.dart';

class AddDiaryUsecase {
  AddDiaryUsecase({required this.repository});

  final DiaryRepository repository;

  Future<void> call(AddDiaryParams params) async {
    return repository.addDiary(params);
  }
}


class AddDiaryParams extends Equatable {
  const AddDiaryParams({
    this.title = '',
    this.content = '',
    this.image,
    this.tag,
  });

  final String title;
  final String content;
  final File? image;
  final String? tag;

  @override
  List<Object?> get props => [title, content, image, tag];

  Map<String, dynamic> toMap(String? imageUrl) {
    return {
      'title': title,
      'content': content,
      'image': imageUrl,
      'tag': tag,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
