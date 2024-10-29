import 'package:flutter/material.dart';
import '../component/t_calandar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay;
  DateTime calendarFocusedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TCalander(
            calendarFocusedDay: calendarFocusedDay,
            onDaySelected: onDaySelected,
            selectedDayPredicate: selectedDayPredicate,
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      calendarFocusedDay = selectedDay;
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime selectedDay) {
    if (this.selectedDay == null) {
      return false;
    }
    return selectedDay.isAtSameMomentAs(this.selectedDay!);
  }
}
