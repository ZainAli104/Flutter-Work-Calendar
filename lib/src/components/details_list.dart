import 'package:first_project/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'details_list/details_navigator.dart';

class DetailsList extends StatelessWidget {
  DetailsList({Key? key}) : super(key: key);

  // Sample dynamic data
  final List<Map<String, dynamic>> detailsData = [
    {
      "title": "Mon, 16/05",
      "progressBar": 40,
      "trackTime": "2:30 hrs",
    },
    {
      "title": "Tus, 10/05",
      "progressBar": 100,
      "trackTime": "4:30 hrs",
    },
    {
      "title": "Wed, 11/05",
      "progressBar": 50,
      "trackTime": "3:00 hrs",
    },
    {
      "title": "Thu, 12/05",
      "progressBar": 20,
      "trackTime": "1:30 hrs",
    },
    {
      "title": "Fri, 13/05",
      "progressBar": 90,
      "trackTime": "6:00 hrs",
    },
    {
      "title": "Sat, 14/05",
      "progressBar": 10,
      "trackTime": "0:45 hrs",
    },
    {
      "title": "Sun, 15/05",
    },
  ];

  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Aug 15 - Aug 21',
              style: TextStyle(
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
                                          data: detailsData[index]),
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
                              vertical: 7.0,
                              horizontal: 30.0,
                            ),
                            tileColor: backgroundColor,
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: Text(
                                    detailsData[index]['title']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.textSubLow,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
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
                                  detailsData[index]['trackTime'] ?? '0:00 hrs',
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
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                footerColumn('Tracked', '22:50 hrs', AppColors.greenTwik),
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
