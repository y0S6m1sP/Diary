import 'package:diary/src/app_bloc.dart';
import 'package:diary/src/app_injector.dart';
import 'package:diary/src/features/auth/data/datasources/auth_data_source.dart';
import 'package:diary/src/features/auth/data/repositories/default_auth_repository.dart';
import 'package:diary/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:diary/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:diary/src/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:diary/src/features/auth/presentation/login/login_cubit.dart';
import 'package:diary/src/features/auth/presentation/register/register_cubit.dart';

void initAuth() {
  sl.registerLazySingleton<AuthDataSource>(
    () => DefaultAuthDataSource(),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => DefalutAuthRepository(
      authDataSource: sl<AuthDataSource>(),
    ),
  );

  sl.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(
      authRepository: sl<AuthRepository>(),
    ),
  );

  sl.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(
      authRepository: sl<AuthRepository>(),
    ),
  );

  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      signInUsecase: sl<SignInUsecase>(),
    ),
  );

  sl.registerFactory<RegisterCubit>(
    () => RegisterCubit(
      signUpUsecase: sl<SignUpUsecase>(),
    ),
  );

  sl.registerFactory<AppBloc>(
    () => AppBloc(
      authRepository: sl<AuthRepository>(),
    ),
  );
}
