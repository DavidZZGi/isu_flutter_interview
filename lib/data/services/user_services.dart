abstract class IUserServices {
  Future<bool> signIn(String username, String password);
  Future<void> signUp(String username, String password);
  Future<bool> checkUserAccount(String username);
}
