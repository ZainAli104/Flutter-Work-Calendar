import 'package:first_project/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'details_list/details_navigator.dart';
import 'details_list/details_data.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailsData = Provider.of<DetailsData>(context).data;

    String getTotalDuration(List<Map<String, dynamic>> detailsData) {
      Duration totalDuration = Duration.zero;

      for (var data in detailsData) {
        var list = data['list'];
        if (list != null && list.isNotEmpty) {
          DateTime startTime = list.first['time'];
          DateTime endTime = list.last['time'];

          Duration duration = endTime.difference(startTime);
          totalDuration += duration;
        }
      }

      String formattedTotalDuration =
          '${totalDuration.inHours.toString().padLeft(2, '0')}:${(totalDuration.inMinutes % 60).toString().padLeft(2, '0')} hrs';

      return formattedTotalDuration;
    }

    String getFormattedDuration(List<Map<String, dynamic>> detailsData, index) {
      // print(detailsData[index]['date_title']);
      var list = detailsData[index]['list'];
      if (list == null || list.isEmpty) {
        return '0:00 hrs';
      }
      DateTime startTime = list.first['time'];
      DateTime endTime = list.last['time'];

      Duration duration = endTime.difference(startTime);
      String formattedDuration =
          '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')} hrs';

      return formattedDuration;
    }

    String getDateRange(List<Map<String, dynamic>> detailsData) {
      if (detailsData.isEmpty) {
        return '';
      }

      DateTime firstDate = detailsData.first['date_title'];
      DateTime lastDate = detailsData.last['date_title'];

      DateFormat dateFormat = DateFormat('MMM d');
      String firstDateString = dateFormat.format(firstDate);
      String lastDateString = dateFormat.format(lastDate);

      return '$firstDateString - $lastDateString';
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(
        25.0,
        25.0,
        25.0,
        25.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              getDateRange(detailsData),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: AppColors.eggPlant, // Change this to your desired color
              ),
            ),
          ),
          // Dynamic list of data
          Expanded(
            child: ListView.builder(
                itemCount: detailsData.length,
                itemBuilder: (context, index) {
                  Color backgroundColor = Colors.transparent;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        decoration: BoxDecoration(
                          border: const Border(
                            bottom: BorderSide(
                              color: AppColors.borderColorWhite,
                              width: 1.0,
                            ),
                          ),
                          color: backgroundColor,
                        ),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  opaque:
                                      false, // Allow transparency for the background color
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      DetailsNavigator(
                                    data: detailsData[index],
                                    listData: detailsData[index]['list'] ?? [],
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(
                                        1, 0.0); // Start from the right edge
                                    const end = Offset(
                                        0.52, 0.0); // End at the halfway point
                                    const curve = Curves.easeInOut;

                                    final tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

                                    return Stack(
                                      children: [
                                        // Add a GestureDetector to listen for tap events on the background
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                        ),
                                        SlideTransition(
                                          position: animation.drive(tween),
                                          child: FractionallySizedBox(
                                            widthFactor:
                                                0.66, // Limit the width of the DetailsNavigator to half the screen
                                            alignment: Alignment.centerRight,
                                            child: child,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 30.0,
                            ),
                            tileColor: backgroundColor,
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    DateFormat('E, M/d').format(
                                        (detailsData[index]['date_title']
                                                as DateTime?) ??
                                            DateTime.now()),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.textSubLow,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 3.0),
                                Expanded(
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      final fullWidth = constraints.maxWidth;
                                      final progressBarValue =
                                          detailsData[index]['progressBar'] !=
                                                      null &&
                                                  detailsData[index]
                                                          ['progressBar'] !=
                                                      0
                                              ? (detailsData[index]
                                                              ['progressBar']!
                                                          as int)
                                                      .toDouble() /
                                                  100
                                              : 0;
                                      final valueWidth =
                                          fullWidth * progressBarValue;
                                      final isGrayBar = progressBarValue == 0;

                                      return Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: SizedBox(
                                              height: 11,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  width: isGrayBar
                                                      ? fullWidth
                                                      : valueWidth,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: isGrayBar
                                                        ? const Color.fromARGB(
                                                            255, 229, 228, 228)
                                                        : AppColors.greenTwik,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 7.0),
                                Text(
                                  getFormattedDuration(detailsData, index),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color:
                                        detailsData[index]['trackTime'] != null
                                            ? AppColors.textSubLow
                                            : Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 7.0),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Color.fromRGBO(0, 0, 0, 0.9),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),

          // Footer widget
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                footerColumn('Tracked', getTotalDuration(detailsData),
                    AppColors.greenTwik),
                footerColumn('Manual', null, Colors.lightGreen),
                footerColumn(
                    'Over limit', null, const Color.fromARGB(255, 242, 76, 64)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget footerColumn(String title, String? time, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4.0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          time ?? '0:00 hrs',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: time != null ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}
