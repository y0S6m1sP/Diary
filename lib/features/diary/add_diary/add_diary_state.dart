import 'dart:io';

import 'package:diary/core/utils/api_status.dart';
import 'package:equatable/equatable.dart';

final class AddDiaryState extends Equatable {
  const AddDiaryState({
    this.title = '',
    this.content = '',
    this.image,
    this.tag,
    this.status = ApiStatus.initial,
  });

  final String title;
  final String content;
  final File? image;
  final String? tag;
  final ApiStatus status;

  @override
  List<Object?> get props => [title, content, image, tag, status];

  AddDiaryState copyWith({
    String? title,
    String? content,
    File? image,
    String? tag,
    ApiStatus? status,
  }) {
    return AddDiaryState(
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      tag: tag ?? this.tag,
      status: status ?? this.status,
    );
  }
}
