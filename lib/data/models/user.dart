class User {
  final String username;
  final String password;
  User({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      username: map['clientName'],
      password: map['address'],
    );
  }
}
