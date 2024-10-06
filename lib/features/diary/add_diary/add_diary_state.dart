import 'dart:io';

import 'package:equatable/equatable.dart';

final class AddDiaryState extends Equatable {
  const AddDiaryState({
    this.title = '',
    this.content = '',
    this.image,
  });

  final String title;
  final String content;
  final File? image;

  @override
  List<Object?> get props => [title, content, image];

  AddDiaryState copyWith({
    String? title,
    String? content,
    File? image,
  }) {
    return AddDiaryState(
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
    );
  }
}
