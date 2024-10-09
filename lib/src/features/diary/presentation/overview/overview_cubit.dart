import 'package:diary/src/features/diary/domain/repository/diary_repository.dart';
import 'package:diary/src/features/diary/presentation/overview/overview_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit(this._diaryRepository) : super(const OverviewState());

  final DiaryRepository _diaryRepository;

  void selectedTagChanged(String tag) {
    emit(state.copyWith(selectedTag: tag));
    if (tag == 'all') {
      emit(state.copyWith(sortedDiaries: state.diaries));
    } else {
      final sortedDiaries =
          state.diaries.where((diary) => diary.tag == tag).toList();
      emit(state.copyWith(sortedDiaries: sortedDiaries));
    }
  }

  void watchDiaries() {
    _diaryRepository.watchDiaries().listen((diaries) {
      emit(state.copyWith(
          diaries: diaries, sortedDiaries: diaries, selectedTag: 'all'));
    });
  }
}
