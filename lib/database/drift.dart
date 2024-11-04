import 'dart:io';
import 'package:drift/native.dart';
import '../model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

part 'drift.g.dart';

@DriftDatabase(
  tables: [ScheduleTable]
)
class AppDatabase extends _$AppDatabase {
  /// terminal command word
  /// >> dart run build_runner build
  /// return file to 'drift.g.dart'
  AppDatabase() : super(_openConnection());

  /// Future Version
  Future<List<ScheduleTableData>> futureSelectSchedule({required DateTime date}){
    final selectQuery = select(scheduleTable);
    selectQuery.where((table) => table.date.equals(date));
    selectQuery.orderBy([
      (table) => OrderingTerm(expression: table.startTime, mode: OrderingMode.asc),
    ]);
    return selectQuery.get();
  }

  Future<int> futureInsertSchedule(ScheduleTableCompanion data) => into(scheduleTable).insert(data);

  Future<ScheduleTableData> futureSelectScheduleOne(int schedleId){
    final selectOneQuery = select(scheduleTable);
    selectOneQuery.where((table) => table.scheduleId.equals(schedleId));
    return selectOneQuery.getSingle();
  }

  Future<int> futureUpdateSchedule(int scheduleId, ScheduleTableCompanion data){
    final updateQuery = update(scheduleTable);
    updateQuery.where((table) => table.scheduleId.equals(scheduleId));
    return updateQuery.write(data);
  }

  Future<int> futureDeleteSchedule({required int scheduleId}){
    final deleteQuery = delete(scheduleTable);
    deleteQuery.where((table) => table.scheduleId.equals(scheduleId));
    return deleteQuery.go();
  }


  /// Stream Version
  Stream<List<ScheduleTableData>> streamSelectSchedules({required DateTime date}){
    final selectQuery = select(scheduleTable);
    selectQuery.where((table) => table.date.equals(date));
    selectQuery.orderBy([
          (table) => OrderingTerm(expression: table.startTime, mode: OrderingMode.asc),
    ]);
    return selectQuery.watch();
  }

  Stream<List<bool>> streamSelectBetweenSchedules({
    required DateTime date,
    required int startTime,
    required int endTime,
    required String scheduleIdInfo,
  }){
    final selectQuery = select(scheduleTable);
    selectQuery.where((table) => table.date.equals(date));

    return selectQuery.addColumns([]).map((row) {
      final dbStartTime = row.rawData.data['schedule_table.start_time'];
      final dbEndTime = row.rawData.data['schedule_table.end_time'];
      final dbScheduleId = row.rawData.data['schedule_table.schedule_id'];

      if(scheduleIdInfo != '' && dbScheduleId == int.parse(scheduleIdInfo)){
        return true;
      }
      else if((dbStartTime < startTime && startTime < dbEndTime)
          ||(dbStartTime < endTime && endTime < dbEndTime)
          ||(startTime < dbStartTime && dbEndTime < endTime)
          ||(startTime <= dbStartTime && dbEndTime < endTime)
          ||(startTime < dbStartTime && dbEndTime <= endTime)) {
        return false;
      }else{
        return true;
      }
    }).watch();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    if(Platform.isAndroid){
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cacheBase = await getTemporaryDirectory();
    sqlite3.tempDirectory = cacheBase.path;
    return NativeDatabase.createBackgroundConnection(file);
  });
}