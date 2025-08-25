class Timbrature {
  final int id;
  final int userId;
  final DateTime timestamp;
  final String actionType;
  final String location;
  final String? geolocation;

  Timbrature({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.actionType,
    required this.location,
    this.geolocation,
  });
}
