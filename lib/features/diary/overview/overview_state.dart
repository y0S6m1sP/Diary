import 'package:diary/data/model/diary.dart';
import 'package:equatable/equatable.dart';

class OverviewState extends Equatable {
  const OverviewState({
    this.diaries = const [],
    this.tags = const [],
    this.selectedTag = 'all',
  });

  final List<Diary> diaries;
  final List<String> tags;
  final String selectedTag;

  @override
  List<Object?> get props => [diaries, tags, selectedTag];

  OverviewState copyWith({
    List<Diary>? diaries,
    List<String>? tags,
    String? selectedTag,
  }) {
    return OverviewState(
      diaries: diaries ?? this.diaries,
      tags: tags ?? this.tags,
      selectedTag: selectedTag ?? this.selectedTag,
    );
  }
}
