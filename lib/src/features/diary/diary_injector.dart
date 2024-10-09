import 'package:diary/src/app_injector.dart';
import 'package:diary/src/features/diary/data/datasources/diary_data_source.dart';
import 'package:diary/src/features/diary/data/repositories/default_diary_repository.dart';
import 'package:diary/src/features/diary/domain/repositories/diary_repository.dart';
import 'package:diary/src/features/diary/domain/usecases/add_diary_usecase.dart';
import 'package:diary/src/features/diary/domain/usecases/watch_diaries_usecase.dart';
import 'package:diary/src/features/diary/presentation/add_diary/add_diary_bloc.dart';
import 'package:diary/src/features/diary/presentation/overview/overview_cubit.dart';

void initDiary() {
  sl.registerLazySingleton<DiaryDataSource>(
    () => DefaultDiaryDataSource(),
  );

  sl.registerLazySingleton<DiaryRepository>(
    () => DefaultDiaryRepository(
      diaryDataSource: sl<DiaryDataSource>(),
    ),
  );

  sl.registerLazySingleton<AddDiaryUsecase>(
    () => AddDiaryUsecase(
      repository: sl<DiaryRepository>(),
    ),
  );

  sl.registerLazySingleton<WatchDiariesUsecase>(
    () => WatchDiariesUsecase(
      repository: sl<DiaryRepository>(),
    ),
  );

  sl.registerFactory<AddDiaryBloc>(
    () => AddDiaryBloc(
      addDiaryUsecase: sl<AddDiaryUsecase>(),
    ),
  );

  sl.registerFactory<OverviewCubit>(
    () => OverviewCubit(
      watchDiariesUsecase: sl<WatchDiariesUsecase>(),
    ),
  );
}
