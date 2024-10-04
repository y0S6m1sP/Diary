abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(String email, String password);

  Future<void> signUp({required String email, required String password});
}
