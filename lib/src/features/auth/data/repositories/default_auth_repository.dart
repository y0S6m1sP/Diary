import 'package:diary/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:diary/src/features/auth/domain/entities/user.dart';

final _auth = firebase_auth.FirebaseAuth.instance;

class DefalutAuthRepository extends AuthRepository {
  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
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
