import 'package:isu_flutter_interview/core/use_case.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:isu_flutter_interview/domain/repositories/user_repository.dart';

class UserSignIn implements UseCase<bool, User> {
  UserRepository userRepository;
  UserSignIn({required this.userRepository});

  @override
  bool call(User user) => userRepository.signIn(user.username, user.password);

  bool checkUserAccount() => userRepository.checkUserAccount();
}
