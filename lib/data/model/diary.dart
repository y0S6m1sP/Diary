import 'package:diary/core/utils/group_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.jm();

class Diary extends Equatable {
  const Diary({
    required this.id,
    required this.title,
    required this.content,
    this.image,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String content;
  final String? image;
  final DateTime createdAt;

  String get formattedTime => formatter.format(createdAt);

  String get groupName => GroupFormatter.format(createdAt);

  @override
  List<Object?> get props => [id, title, content, image, createdAt];
}
