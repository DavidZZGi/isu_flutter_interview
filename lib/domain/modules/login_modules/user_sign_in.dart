import 'package:isu_flutter_interview/core/use_case.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:isu_flutter_interview/domain/repositories/user_repository.dart';

class UserSignIn implements UseCase<Future<bool>, User> {
  UserRepository userRepository;
  UserSignIn({required this.userRepository});

  @override
  Future<bool> call(User user) async =>
      await userRepository.signIn(user.username, user.password);

  Future<bool> checkUserAccount(String username) async =>
      await userRepository.checkUserAccount(username);
}
