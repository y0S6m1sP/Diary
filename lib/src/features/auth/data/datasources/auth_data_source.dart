import 'package:diary/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:diary/src/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:diary/src/features/auth/domain/entities/user.dart';

final _auth = firebase_auth.FirebaseAuth.instance;

abstract class AuthDataSource {
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

class DefaultAuthDataSource extends AuthDataSource {
  @override
  Future<void> signInWithEmailAndPassword({
    required SignInParams params,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  @override
  Future<void> signUp({required SignUpParams params}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  @override
  void signOut() {
    _auth.signOut();
  }

  @override
  Stream<User> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser?.toUser ?? User.empty;
      return user;
    });
  }

  @override
  get currentUser => _auth.currentUser?.toUser ?? User.empty;
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid);
  }
}
