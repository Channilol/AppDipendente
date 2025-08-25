class User {
  final int id;
  final String name;
  final String email;
  final DateTime bornDate;
  final int roleId;
  final int? managerId;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.bornDate,
    required this.roleId,
    this.managerId,
  });
}
