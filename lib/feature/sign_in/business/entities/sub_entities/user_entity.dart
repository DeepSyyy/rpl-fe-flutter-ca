class UserEntity {
  final String userId;
  final String name;
  final String email;
  final String password;
  final bool isVerified;
  final DateTime createAt;

  UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.isVerified,
    required this.createAt,
  });
}
