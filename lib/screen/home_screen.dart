import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/model/schedule.dart';
import 'package:flutter/material.dart';
import '../component/t_calandar.dart';
import '../const/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime calendarFocusedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  Map<DateTime, List<Schedule>> schedules = {
    DateTime.utc(2024, 10, 30): [
      Schedule(
        scheduleId: 1,
        startTime: 11,
        endTime: 12,
        content: 'content',
        date: DateTime.utc(2024, 10, 30),
        category: categoryColors[0],
        createTime: DateTime.now().toUtc(),
      ),
      Schedule(
        scheduleId: 2,
        startTime: 15,
        endTime: 17,
        content: 'test 1',
        date: DateTime.utc(2024, 10, 30),
        category: categoryColors[5],
        createTime: DateTime.now().toUtc(),
      ),
      Schedule(
        scheduleId: 3,
        startTime: 22,
        endTime: 23,
        content: 'test 2',
        date: DateTime.utc(2024, 10, 30),
        category: categoryColors[3],
        createTime: DateTime.now().toUtc(),
      ),
    ],
    DateTime.utc(2024, 10, 31): [
      Schedule(
        scheduleId: 4,
        startTime: 07,
        endTime: 09,
        content: 'test 3',
        date: DateTime.utc(2024, 10, 30),
        category: categoryColors[5],
        createTime: DateTime.now().toUtc(),
      ),
      Schedule(
        scheduleId: 5,
        startTime: 14,
        endTime: 15,
        content: 'test 4',
        date: DateTime.utc(2024, 10, 30),
        category: categoryColors[3],
        createTime: DateTime.now().toUtc(),
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    print(schedules.toString());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Schedule scheduleInfo = await showModalBottomSheet(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(
                selectedDay: selectedDay,
              );
            },
          );
          setState(() {
            // if(schedules.containsKey(scheduleInfo.date)){
            //   List<Schedule> scheduleList = schedules[scheduleInfo.date]!.map((modelData) => modelData).toList();
            //   scheduleList.add(scheduleInfo);
            //   schedules[scheduleInfo.date] = scheduleList;
            // }else{
            //   List<Schedule> scheduleList = [];
            //   scheduleList.add(scheduleInfo);
            //   schedules[scheduleInfo.date] = scheduleList;
            // }

            schedules = {
              ...schedules,
              scheduleInfo.date: [
                if (schedules.containsKey(scheduleInfo.date)) ...schedules[scheduleInfo.date]!,
                scheduleInfo,
              ]
            };
          });
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TCalander(
              calendarFocusedDay: calendarFocusedDay,
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              taskCount: schedules.containsKey(selectedDay)
                  ? schedules[selectedDay]!.length
                  : 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                ),
                child: ListView.builder(
                  itemCount: schedules.containsKey(selectedDay)
                      ? schedules[selectedDay]!.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    final selectedSchedules = schedules[selectedDay]!;
                    final scheduleModel = selectedSchedules[index];
                    return ScheduleCard(
                      startTime: scheduleModel.startTime,
                      endTime: scheduleModel.endTime,
                      content: scheduleModel.content,
                      color: Color(
                        int.parse('FF${scheduleModel.category}', radix: 16),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
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
    return selectedDay.isAtSameMomentAs(this.selectedDay);
  }
}
