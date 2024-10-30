class Schedule {
  final int scheduleId;
  final int startTime;
  final int endTime;
  final String content;
  final DateTime date;
  final String category;
  final DateTime createTime;

  Schedule({
    required this.scheduleId,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.date,
    required this.category,
    required this.createTime,
  });
}
