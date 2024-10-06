import 'package:diary/data/model/user.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String password,
  });

  void signOut();

  Stream<User> get user;

  get currentUser;
}
