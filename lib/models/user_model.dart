import 'UserType.dart';

class User {
  final String email;
  final String password;
  final UserType userType;
  final String username;

  User({
    required this.email,
    required this.password,
    required this.userType,
    required this.username,
  });

  bool get isAdmin => userType == UserType.admin;
}

List<User> users = [
  User(
      username: 'admin',
      userType: UserType.admin,
      email: 'admin@sl3v1.com',
      password: 'Xx123'),
  User(
      username: 'cliente1',
      userType: UserType.client,
      email: 'cliente1@sl3v1.com',
      password: '1234'),
  User(
      username: 'cliente2',
      userType: UserType.client,
      email: 'cliente2@sl3v1.com',
      password: '5678'),
];
