import 'package:flutter/material.dart';
import 'package:calendar_scheduler/const/color.dart';
import 'package:table_calendar/table_calendar.dart';

class TCalander extends StatefulWidget {
  final DateTime calendarFocusedDay;
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;

  const TCalander({
    required this.calendarFocusedDay,
    required this.onDaySelected,
    required this.selectedDayPredicate,
    super.key,
  });

  @override
  State<TCalander> createState() => _TCalanderState();
}

class _TCalanderState extends State<TCalander> {
  DateTime? selectedDay;
  DateTime calendarFirstDay = DateTime(1800);
  DateTime calendarLastDay = DateTime(2050);

  @override
  Widget build(BuildContext context) {
    final defaultBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      border: Border.all(
        color: Colors.grey[200]!,
        width: 1.0,
      ),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: widget.calendarFocusedDay,
      firstDay: calendarFirstDay,
      lastDay: calendarLastDay,
      headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          )),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        todayDecoration: defaultBoxDecoration.copyWith(
          color: primaryColor,
        ),
        outsideDecoration: defaultBoxDecoration.copyWith(
            border: Border.all(
          color: Colors.transparent,
        )),
        defaultDecoration: defaultBoxDecoration,
        weekendDecoration: defaultBoxDecoration,
        selectedDecoration: defaultBoxDecoration.copyWith(
          border: Border.all(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: primaryColor,
        ),
      ),
      onDaySelected: widget.onDaySelected,
      selectedDayPredicate: widget.selectedDayPredicate,
    );
  }
}
