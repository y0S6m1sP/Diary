import 'package:diary/domain/repository/diary_repository.dart';
import 'package:diary/features/diary/overview/overview_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit(this._diaryRepository) : super(const OverviewState());

  final DiaryRepository _diaryRepository;

  void selectedTagChanged(String tag) {
    emit(state.copyWith(selectedTag: tag));
  }

  void watchDiaries() {
    _diaryRepository.watchDiaries().listen((diaries) {
      emit(state.copyWith(diaries: diaries));
    });
  }
}