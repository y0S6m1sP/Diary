import 'package:diary/src/features/auth/data/datasources/auth_data_source.dart';
import 'package:diary/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:diary/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:diary/src/features/auth/domain/entities/user.dart';
import 'package:diary/src/features/auth/domain/usecases/sign_up_usecase.dart';

class DefalutAuthRepository extends AuthRepository {
  DefalutAuthRepository({
    required this.authDataSource,
  });

  final AuthDataSource authDataSource;

  @override
  Future<void> signInWithEmailAndPassword({
    required SignInParams params,
  }) async {
    await authDataSource.signInWithEmailAndPassword(params: params);
  }

  @override
  Future<void> signUp({required SignUpParams params}) async {
    await authDataSource.signUp(params: params);
  }

  @override
  void signOut() {
    authDataSource.signOut();
  }

  @override
  Stream<User> get user {
    return authDataSource.user;
  }

  @override
  get currentUser => authDataSource.currentUser;
}
