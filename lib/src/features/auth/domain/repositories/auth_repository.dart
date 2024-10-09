import 'package:diary/src/features/auth/domain/entities/user.dart';
import 'package:diary/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:diary/src/features/auth/domain/usecases/sign_up_usecase.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword({
    required SignInParams params,
  });

  Future<void> signUp({
    required SignUpParams params,
  });

  void signOut();

  Stream<User> get user;

  get currentUser;
}
