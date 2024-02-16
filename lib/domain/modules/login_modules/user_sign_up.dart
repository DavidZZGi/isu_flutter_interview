import 'package:isu_flutter_interview/core/use_case.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:isu_flutter_interview/domain/repositories/user_repository.dart';

class UserSignUp implements UseCase<void, User> {
  UserRepository userRepository;
  UserSignUp({required this.userRepository});

  @override
  void call(User user) => userRepository.signUp(user.username, user.password);
}
