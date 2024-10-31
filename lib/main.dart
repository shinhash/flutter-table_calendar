import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'database/drift.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  final database = AppDatabase();
  GetIt.I.registerSingleton<AppDatabase>(database);

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    )
  );
}
