class AuthCredentials {
  final int id;
  final int userId;
  final String passwordHash;
  final String salt;
  final DateTime createdAt;
  final DateTime modifiedAt;

  AuthCredentials({
    required this.id,
    required this.userId,
    required this.passwordHash,
    required this.salt,
    required this.createdAt,
    required this.modifiedAt,
  });
}
