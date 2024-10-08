import 'package:diary/data/model/diary.dart';
import 'package:equatable/equatable.dart';

class OverviewState extends Equatable {
  const OverviewState({
    this.diaries = const [],
  });

  final List<Diary> diaries;

  @override
  List<Object?> get props => [diaries];

}