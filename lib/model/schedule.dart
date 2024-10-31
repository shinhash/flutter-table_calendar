import 'package:drift/drift.dart';

class ScheduleTable extends Table {
  // final int scheduleId;
  // final int startTime;
  // final int endTime;
  // final String content;
  // final DateTime date;
  // final String category;
  // final DateTime createTime;
  //
  // Schedule({
  //   required this.scheduleId,
  //   required this.startTime,
  //   required this.endTime,
  //   required this.content,
  //   required this.date,
  //   required this.category,
  //   required this.createTime,
  // });

  IntColumn get scheduleId => integer().autoIncrement()();

  IntColumn get startTime => integer()();

  IntColumn get endTime => integer()();

  TextColumn get content => text()();

  DateTimeColumn get date => dateTime()();

  TextColumn get category => text()();

  DateTimeColumn get createTime => dateTime().clientDefault(() => DateTime.now().toUtc())();
}
