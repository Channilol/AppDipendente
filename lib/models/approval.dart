class Approval {
  final int id;
  final int requestId;
  final String status;
  final String comment;
  final DateTime approvedAt;

  Approval({
    required this.id,
    required this.requestId,
    required this.status,
    required this.comment,
    required this.approvedAt,
  });
}
