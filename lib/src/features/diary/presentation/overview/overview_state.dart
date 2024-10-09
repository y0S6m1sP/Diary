import 'package:diary/src/features/diary/domain/entities/diary.dart';
import 'package:equatable/equatable.dart';

class OverviewState extends Equatable {
  const OverviewState({
    this.diaries = const [],
    this.sortedDiaries = const [],
    this.selectedTag = 'all',
  });

  final List<Diary> diaries;
  final List<Diary> sortedDiaries;
  final String selectedTag;

  @override
  List<Object?> get props => [diaries, sortedDiaries, selectedTag];

  OverviewState copyWith({
    List<Diary>? diaries,
    List<Diary>? sortedDiaries,
    String? selectedTag,
  }) {
    return OverviewState(
      diaries: diaries ?? this.diaries,
      sortedDiaries: sortedDiaries ?? this.sortedDiaries,
      selectedTag: selectedTag ?? this.selectedTag,
    );
  }
}
