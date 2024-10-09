import 'package:diary/src/features/diary/domain/usecases/watch_diaries_usecase.dart';
import 'package:diary/src/features/diary/presentation/overview/overview_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit({required this.watchDiariesUsecase})
      : super(const OverviewState());

  final WatchDiariesUsecase watchDiariesUsecase;

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
    watchDiariesUsecase().listen((diaries) {
      emit(state.copyWith(
          diaries: diaries, sortedDiaries: diaries, selectedTag: 'all'));
    });
  }
}
