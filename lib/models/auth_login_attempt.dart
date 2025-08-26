class AuthLoginAttempt {
  final int id;
  final int userId;
  final DateTime timestamp;
  final String result;

  AuthLoginAttempt({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.result,
  });
}
