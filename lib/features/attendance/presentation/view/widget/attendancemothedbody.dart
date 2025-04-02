import 'package:flutter/material.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/reportattandance.dart';
import 'package:table_calendar/table_calendar.dart';

class Attendancemothedbody extends StatelessWidget {
  const Attendancemothedbody({super.key, required this.reportattandancemodel});
  final Reportattandancemodel reportattandancemodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 7,
            child: Container(
              //   width: 400,
              margin: EdgeInsets.all(12),
              // color: kcolorwhite,
              decoration: BoxDecoration(
                  color: kcolorwhite, borderRadius: BorderRadius.circular(12)),
              child: customtablecalendar(
                reword: reportattandancemodel.attendanceRecords!,
                reportattandancemodel: reportattandancemodel,
              ),
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                      width: 170,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                            color: kbluesetting,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Present",
                            style: Textstyles.font16boldwithe,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kcolorwhite,
                    ),
                    child: Center(
                        child: Text(
                            reportattandancemodel.totalPresent.toString())),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 170,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          color: kbluesetting,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Absent",
                          style: Textstyles.font16boldwithe,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kcolorwhite,
                    ),
                    child: Center(
                        child:
                            Text(reportattandancemodel.totalAbsent.toString())),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class customtablecalendar extends StatefulWidget {
  const customtablecalendar({
    super.key,
    required this.reportattandancemodel,
    required this.reword,
  });
  final List reword;
  final Reportattandancemodel reportattandancemodel;
  @override
  State<customtablecalendar> createState() => _customtablecalendarState();
}

class _customtablecalendarState extends State<customtablecalendar> {
  int num = 0;
  List<DateTime> days = [];
  List<int> year = [];
  List<int> month = [];
  List<DateTime> daysatt = [];
  List<String> wordyear = [];
  @override
  void initState() {
    var data = widget.reportattandancemodel.attendanceRecords;
    // TODO: implement initState
    super.initState();
    //  num = widget.reportattandancemodel.attendanceRecords![0].attendAt!.length;

    // print(widget.reword.length.toString());
    List<String> lange = [];
    for (int i = 0;
        i < widget.reportattandancemodel.attendanceRecords!.length;
        i++) {
      lange.add(data![i].attendAt.toString());
      List<String> words = lange[i].split(RegExp(' '));
      wordyear = words[0].split('-');
      if (data[i].attendanceStatus == 0) {
        days.add(
          DateTime(int.tryParse(wordyear[0])!, int.tryParse(wordyear[1])!,
              int.tryParse(wordyear[2])!),
        );
      } else {
        daysatt.add(
          DateTime(int.tryParse(wordyear[0])!, int.tryParse(wordyear[1])!,
              int.tryParse(wordyear[2])!),
        );
      }

      //  year[i] = int.tryParse(wordyear[0].toString())!;
      //  month[i] = int.tryParse(wordyear[1].toString())!;
      // day[i] = int.tryParse(wordyear[2].toString())!;
    }
    print(wordyear.toString());
    // widget.reportattandancemodel.attendanceRecords.first.attendAt[]
    // widget.reword;
    // days = [
    //   DateTime(int.tryParse(wordyear[0])!, int.tryParse(wordyear[1])!,
    //       int.tryParse(wordyear[2])!),
    // ];
  }

  // void _onDaySelected(DateTime selectedDay) {
  //   setState(() {
  //     if (see.contains(selectedDay)) {
  //       see.remove(selectedDay); // Deselect if already selected
  //     } else {
  //       see.add(selectedDay); // Add to selected days
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) {
        return days.any((d) => isSameDay(d, day)) ||
            daysatt.any((d) => isSameDay(d, day));
        // return days.any((d) => isSameDay(d, day));
      },

      daysOfWeekHeight: 40,
      startingDayOfWeek: StartingDayOfWeek.monday,

      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, data, _) {
          if (days.any((d) => isSameDay(d, data))) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.red, // Color for the first list
                shape: BoxShape.circle,
              ),
              child: Center(child: Text('${data.day}')),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                color: Colors.green, // Color for the first list
                shape: BoxShape.circle,
              ),
              child: Center(child: Text('${data.day}')),
            );
          }
        },
        todayBuilder: (context, date, _) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white, // Color for the focused day
              shape: BoxShape.circle,
            ),
            child: Center(child: Text('${date.day}')),
          );
        },
      ),

      // calendarStyle: CalendarStyle(
      //     selectedDecoration: BoxDecoration(
      //       color: Colors.red, // Color for selected day
      //       shape: BoxShape.circle,
      //     ),
      //     // rangeHighlightColor: kprimarykey,
      //     isTodayHighlighted: true,
      //     rangeHighlightScale: 2.2),
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) =>
            ['Mo', 'tu', 'We', 'Th', 'Fr', 'Sa', 'Su'][date.weekday - 1],
        weekendStyle: TextStyle(
          decorationThickness: 100,
          fontSize: 20,
          color: kcolorwhite,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kprimarykey,
        ),
        weekdayStyle: TextStyle(
            fontSize: 20, color: kcolorwhite, backgroundColor: kprimarykey),
      ),
      headerStyle: HeaderStyle(titleCentered: true, formatButtonVisible: false),
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2010, 2, 10),
      lastDay: DateTime.utc(2030, 2, 10),
    );
  }
}
