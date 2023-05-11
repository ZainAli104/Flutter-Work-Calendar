import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'details_list/details_data.dart';
import 'package:intl/intl.dart';

import '../app_colors.dart';

class CalenderDisplayPage extends StatefulWidget {
  final ValueChanged<List<DateTime>> onWeekSelected;
  final ValueChanged<List<DateTime>> onRangeSelected;

  const CalenderDisplayPage({
    Key? key,
    required this.onWeekSelected,
    required this.onRangeSelected,
  }) : super(key: key);

  @override
  State<CalenderDisplayPage> createState() => _CalenderDisplayPageState();
}

class _CalenderDisplayPageState extends State<CalenderDisplayPage> {
  var startOfWeek = DateTime.now().toUtc();
  var endOfWeek = DateTime.now().toUtc();
  DateTime? rangeStart;
  DateTime? rangeEnd;
  final ValueNotifier<DateTime> _focusedDay =
      ValueNotifier(DateTime.now().toUtc());
  bool isWeekMode = true; // Add this to keep track of the current mode
  List<DateTime> checkProgressDates = [];

  Future<void> _selectMonthAndYear(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _focusedDay.value,
      firstDate: DateTime.utc(2015, 1),
      lastDate: DateTime.utc(2035, 12),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != _focusedDay.value) {
      _onDaySelected(picked.toUtc(), _focusedDay.value.toUtc());
      setState(() {
        _focusedDay.value = DateTime.utc(picked.year, picked.month);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    endOfWeek = startOfWeek.add(const Duration(days: 5));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onDaySelected(
        startOfWeek,
        startOfWeek,
      );
    });
    DetailsData detailsData = Provider.of<DetailsData>(context, listen: false);
    checkProgressDates = detailsData.getDateTitles();
  }

  @override
  void dispose() {
    _focusedDay.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }

  Widget weekDateBuilder(context, day, focusedDay) {
    bool isSelectedWeek =
        day.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
            (day.isBefore(endOfWeek.add(const Duration(days: 0))) ||
                isSameDay(day, endOfWeek));

    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.zero,
      color: isSelectedWeek ? AppColors.eggPlant : null,
    );

    if (isSelectedWeek) {
      if (day.day == startOfWeek.day &&
          day.month == startOfWeek.month &&
          day.year == startOfWeek.year) {
        boxDecoration = boxDecoration.copyWith(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(9.0),
            bottomLeft: Radius.circular(9.0),
          ),
        );
      } else if (day.day == endOfWeek.day &&
          day.month == endOfWeek.month &&
          day.year == endOfWeek.year) {
        boxDecoration = boxDecoration.copyWith(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(9.0),
            bottomRight: Radius.circular(9.0),
          ),
        );
      }
    }

    TextStyle dateTextStyle = isSelectedWeek
        ? const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
        : const TextStyle(fontWeight: FontWeight.bold);

    bool isProgress =
        checkProgressDates.contains(DateTime(day.year, day.month, day.day));

    return MouseRegion(
      cursor:
          !isSelectedWeek ? SystemMouseCursors.click : SystemMouseCursors.alias,
      // onHover: (event) {
      //   if (isSelectedWeek) {
      //     print('In selected week');
      //   } else {
      //     print('NotIn selected week');
      //   }
      // },
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
            if (isProgress)
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

  Widget rangeDateBuilder(context, day, focusedDay) {
    bool isSelectedStartDay = isSameDay(rangeStart, day);
    bool isSelectedEndDay = isSameDay(rangeEnd, day);
    bool isWithinRange = (rangeStart != null && rangeEnd != null) &&
        (day.isAfter(rangeStart!) && day.isBefore(rangeEnd!) ||
            isSameDay(rangeStart!, day) ||
            isSameDay(rangeEnd!, day));
    BoxDecoration boxDecoration;

    if (isSelectedStartDay || isSelectedEndDay) {
      boxDecoration = const BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: AppColors.eggPlant,
      );

      if (isSelectedStartDay) {
        boxDecoration = boxDecoration.copyWith(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(9.0),
            bottomLeft: Radius.circular(9.0),
          ),
        );
      } else if (isSelectedEndDay) {
        boxDecoration = boxDecoration.copyWith(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(9.0),
            bottomRight: Radius.circular(9.0),
          ),
        );
      }
    } else if (isWithinRange) {
      boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: AppColors.eggPlant.withOpacity(0.7),
      );
    } else {
      boxDecoration = const BoxDecoration();
    }

    TextStyle dateTextStyle;
    if (isSelectedStartDay || isSelectedEndDay) {
      dateTextStyle =
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    } else if (isWithinRange) {
      dateTextStyle =
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white70);
    } else {
      dateTextStyle =
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
    }

    bool isProgress =
        checkProgressDates.contains(DateTime(day.year, day.month, day.day));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
            if (isProgress)
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
              margin: const EdgeInsets.all(15.0),
              elevation: .0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide.none,
              ),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    _buildCustomHeader(),
                    tableCalenderWidget(),
                  ],
                ),
              ),
            ),
            SwitchListTile(
              title: const Text("Switch to range mode"),
              value: !isWeekMode,
              onChanged: (bool value) {
                setState(() {
                  isWeekMode = !value;
                  if (value) {
                    rangeStart = null;
                    rangeEnd = null;
                  }
                });
              },
              secondary: const Icon(
                Icons.calendar_today,
                color: AppColors.greenTwik,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            // Text(
            //   '${startOfWeek.toString().split(' ')[0]} - ${endOfWeek.toString().split(' ')[0]}',
            //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: AppColors.eggPlant,
              size: 28,
            ),
            onPressed: () {
              setState(() {
                _focusedDay.value =
                    _focusedDay.value.subtract(const Duration(days: 30));
              });
            },
          ),
          InkWell(
            onTap: () => _selectMonthAndYear(context),
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(214, 48, 150, 51),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  Text(
                    DateFormat.yMMMM().format(_focusedDay.value),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                      width: 2.0), // To give some space between text and icon
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: AppColors.eggPlant,
              size: 28,
            ),
            onPressed: () {
              setState(() {
                _focusedDay.value =
                    _focusedDay.value.add(const Duration(days: 30));
              });
            },
          ),
        ],
      ),
    );
  }

  TableCalendar<dynamic> tableCalenderWidget() {
    return TableCalendar(
      calendarBuilders: CalendarBuilders(
        defaultBuilder: isWeekMode ? weekDateBuilder : rangeDateBuilder,
        withinRangeBuilder: isWeekMode ? weekDateBuilder : rangeDateBuilder,
        rangeEndBuilder: isWeekMode ? weekDateBuilder : rangeDateBuilder,
        rangeHighlightBuilder: isWeekMode ? weekDateBuilder : rangeDateBuilder,
        rangeStartBuilder: isWeekMode ? weekDateBuilder : rangeDateBuilder,
      ),
      headerVisible: false,
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
    if (isWeekMode) {
      startOfWeek =
          selectedDay.subtract(Duration(days: selectedDay.weekday - 1)).toUtc();
      endOfWeek = startOfWeek.add(const Duration(days: 6)).toUtc();
      _focusedDay.value = selectedDay.toUtc();
      // print('Selected week: $startOfWeek - $endOfWeek');
      widget.onWeekSelected([startOfWeek, endOfWeek]);
    } else {
      if (rangeStart == null) {
        rangeStart = selectedDay;
      } else if (rangeEnd == null) {
        if (selectedDay.isAfter(rangeStart!)) {
          rangeEnd = selectedDay;
        } else {
          rangeEnd = rangeStart;
          rangeStart = selectedDay;
        }
      } else {
        rangeStart = selectedDay;
        rangeEnd = null;
      }

      if (rangeStart != null && rangeEnd != null) {
        widget.onRangeSelected([rangeStart!, rangeEnd!]);
      }
    }
    setState(() {});
  }
}
