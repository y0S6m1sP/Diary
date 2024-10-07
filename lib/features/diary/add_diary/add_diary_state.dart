import 'dart:io';

import 'package:diary/core/utils/api_status.dart';
import 'package:equatable/equatable.dart';

final class AddDiaryState extends Equatable {
  const AddDiaryState({
    this.title = '',
    this.content = '',
    this.image,
    this.status = ApiStatus.initial,
  });

  final String title;
  final String content;
  final File? image;
  final ApiStatus status;

  @override
  List<Object?> get props => [title, content, image, status];

  AddDiaryState copyWith({
    String? title,
    String? content,
    File? image,
    ApiStatus? status,
  }) {
    return AddDiaryState(
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }
}
