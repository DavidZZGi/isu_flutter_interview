import 'package:isu_flutter_interview/data/local_db/database_helper.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:isu_flutter_interview/data/services/user_services.dart';

class UserRepository implements IUserServices {
  final DatabaseHelper databaseHelper;
  final String userTable = 'user';
  UserRepository(this.databaseHelper);

  @override
  Future<bool> checkUserAccount(String username) async {
    final users = await databaseHelper.getDataFromTable(userTable);
    return users.any((user) => user['username'] == username) ||
        users.isNotEmpty;
  }

  @override
  Future<bool> signIn(String username, String password) async {
    final users = await databaseHelper.getDataFromTable(userTable);
    return users.any(
        (user) => user['username'] == username && user['password'] == password);
  }

  @override
  Future<void> signUp(String username, String password) async {
    await databaseHelper.insertRecord(
        User(username: username, password: password).toMap(), userTable);
  }
}
