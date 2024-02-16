import 'package:isu_flutter_interview/data/local_db/database_helper.dart';
import 'package:isu_flutter_interview/data/services/user_services.dart';

class UserRepository implements UserServices {
  final DatabaseHelper databaseHelper;
  UserRepository(this.databaseHelper);

  @override
  bool checkUserAccount() {
    // TODO: implement checkUserAccount
    throw UnimplementedError();
  }

  @override
  bool signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  void signUp(String email, String password) {
    // TODO: implement signUp
  }
}
