class Requests {
  final int id;
  final int userId;
  final DateTime startDate;
  final DateTime endDate;
  final String requestType;
  final String? note;
  final DateTime createdAt;

  Requests({
    required this.id,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.requestType,
    this.note,
    required this.createdAt,
  });
}
