import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../app_colors.dart';
import '../utils.dart';

class CalenderDisplayPage extends StatefulWidget {
  const CalenderDisplayPage({Key? key}) : super(key: key);

  @override
  State<CalenderDisplayPage> createState() => _CalenderDisplayPageState();
}

class _CalenderDisplayPageState extends State<CalenderDisplayPage> {
  var startOfWeek = DateTime.now();
  var endOfWeek = DateTime.now();
  ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  // dummy data
  Map<DateTime, Map<String, dynamic>> sampleEvents = {
    DateTime(2023, 5, 2): {
      "startTrackTime": DateTime(2023, 5, 2, 7, 20),
      "endTrackTime": DateTime(2023, 5, 2, 11, 50),
      "screenShotDetails": {
        "time": "7:40 AM",
        "image": "",
        "memo": "-",
        "activity": "Idle",
        "activityLevel": ""
      }
    },
  };

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    endOfWeek = startOfWeek.add(const Duration(days: 5));
  }

  @override
  void dispose() {
    _focusedDay.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }

  Widget dateBuilder(context, day, focusedDay) {
    bool isSelectedWeek =
        day.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
            day.isBefore(endOfWeek.add(const Duration(days: 1)));

    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.zero,
      color: isSelectedWeek ? AppColors.eggPlant : null,
    );

    if (isSelectedWeek) {
      if (day == startOfWeek) {
        boxDecoration = boxDecoration.copyWith(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(7.0),
            bottomLeft: Radius.circular(7.0),
          ),
        );
      } else if (day == endOfWeek) {
        boxDecoration = boxDecoration.copyWith(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(7.0),
            bottomRight: Radius.circular(7.0),
          ),
        );
      }
    }

    TextStyle dateTextStyle = isSelectedWeek
        ? const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
        : const TextStyle(fontWeight: FontWeight.bold);

    return MouseRegion(
      cursor:
          !isSelectedWeek ? SystemMouseCursors.click : SystemMouseCursors.alias,
      onHover: (event) {
        if (isSelectedWeek) {
          print('In selected week');
        } else {
          print('NotIn selected week');
        }
      },
      child: Container(
        decoration: boxDecoration,
        child: Stack(
          children: [
            Center(
              child: Text(
                day.day.toString(),
                style: dateTextStyle,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 6, left: 23),
                height: 6,
                width: 6,
                decoration: const BoxDecoration(
                  color: AppColors.greenTwik,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide.none,
                // side: BorderSide(color: Colors.white, width: 1.0),
              ),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: tableCalenderWidget(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${startOfWeek.toString().split(' ')[0]} - ${endOfWeek.toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  TableCalendar<dynamic> tableCalenderWidget() {
    return TableCalendar(
      calendarBuilders: CalendarBuilders(
        defaultBuilder: dateBuilder,
        withinRangeBuilder: dateBuilder,
        rangeEndBuilder: dateBuilder,
        rangeHighlightBuilder: dateBuilder,
        rangeStartBuilder: dateBuilder,
      ),

      headerStyle: const HeaderStyle(
        titleCentered: true, // Center the title
        titleTextStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: AppColors.eggPlant, // Change this to your desired color
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        formatButtonVisible: false,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: AppColors.eggPlant,
          size: 28,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: AppColors.eggPlant,
          size: 28,
        ),
      ),
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: false,
      ),
      // today's week
      focusedDay: _focusedDay.value,
      // earliest possible date
      firstDay: DateTime.utc(2020, 1, 1),
      // latest allowed date
      lastDay: DateTime.utc(2030, 12, 31),
      // default view when displayed
      calendarFormat: CalendarFormat.month,
      // default is Saturday & Sunday but can be set to any day.
      // instead of day, a number can be mentioned as well.
      weekendDays: const [DateTime.sunday, 6],
      // default is Sunday but can be changed according to locale
      startingDayOfWeek: StartingDayOfWeek.monday,
      // height between the day row and 1st date row, default is 16.0
      daysOfWeekHeight: 40.0,
      // height between the date rows, default is 52.0
      rowHeight: 48.0,
      onDaySelected: _onDaySelected,
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    startOfWeek = selectedDay.subtract(Duration(days: selectedDay.weekday - 1));
    endOfWeek = startOfWeek.add(const Duration(days: 6));
    _focusedDay.value = focusedDay;
    print('Selected week: $startOfWeek - $endOfWeek');

    // Loop through the week's days and print events if they exist
    for (int i = 0; i < 7; i++) {
      DateTime currentDayF = startOfWeek.add(Duration(days: i));
      var currentDay = removeTime(currentDayF);
      if (sampleEvents.containsKey(currentDay)) {
        print('Event on $currentDay: ${sampleEvents[currentDay]}');
      }
    }

    setState(() {});
  }
}
