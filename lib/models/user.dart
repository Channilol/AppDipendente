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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      bornDate: json['born_date'],
      roleId: json['role_id'],
      managerId: json['manager_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'born_date': bornDate,
      'role_id': roleId,
      'manager_id': managerId,
    };
  }
}
