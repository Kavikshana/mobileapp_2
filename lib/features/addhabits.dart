import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../habits.dart';

class AddHabits extends StatefulWidget {
  const AddHabits({super.key});

  @override
  State<StatefulWidget> createState() => _AddHabitsState();
}

class _AddHabitsState extends State<AddHabits> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 0.0),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // Border color
                          width: 2.0, // Border width
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      //height: 180,
                      child: TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay: DateTime.utc(2023, 01, 01),
                        lastDay: DateTime.utc(2025, 01, 01),
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        //calendarFormat: _calendarFormat,
                        calendarFormat: _calendarFormat,
                        availableCalendarFormats: const {
                          // CalendarFormat.month: 'Month',
                          // CalendarFormat.twoWeeks: '2 weeks',
                          CalendarFormat.week: 'Week',
                        },
                        rowHeight: 40.0,
                        daysOfWeekHeight: 20.0,
                        onFormatChanged: (format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                      ),
                    ),
      //],
                  //),
          //       ),
          //       // ),
               //],
             //);
            // );
          // ),
          //SizedBox(height: 10.0),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                      child: Habits(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
