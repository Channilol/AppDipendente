class LeaveBalance {
  final int id;
  final int userId;
  final double accruedHoliday;
  final double accruedPermits;
  final DateTime modifiedAt;

  LeaveBalance({
    required this.id,
    required this.userId,
    required this.accruedHoliday,
    required this.accruedPermits,
    required this.modifiedAt,
  });
}
