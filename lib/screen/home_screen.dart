import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../component/t_calandar.dart';
import '../const/color.dart';
import '../database/drift.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(
                selectedDay: selectedDay,
              );
            },
          );
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
              taskCount: 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                ),
                child: StreamBuilder<List<ScheduleTableData>>(
                  stream: GetIt.I<AppDatabase>().streamSelectSchedules(date: selectedDay),
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }

                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final schedules = snapshot.data!;

                    return ListView.builder(
                      itemCount: schedules.length,
                      itemBuilder: (BuildContext context, int index) {
                        final scheduleModel = schedules[index];
                        return Dismissible(
                          key: ObjectKey(scheduleModel.scheduleId),
                          direction: DismissDirection.endToStart,
                          // confirmDismiss: (DismissDirection direction) async {
                          //   await GetIt.I<AppDatabase>().streamDeleteSchedule(scheduleId: scheduleModel.scheduleId);
                          //   return true;
                          // },
                          onDismissed: (DismissDirection direction){
                            GetIt.I<AppDatabase>().futureDeleteSchedule(scheduleId: scheduleModel.scheduleId);
                          },
                          child: ScheduleCard(
                            startTime: scheduleModel.startTime,
                            endTime: scheduleModel.endTime,
                            content: scheduleModel.content,
                            color: Color(int.parse('FF${scheduleModel.category}', radix: 16)),
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
            ),
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
