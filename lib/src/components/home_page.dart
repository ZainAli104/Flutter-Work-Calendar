import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calender_display_page.dart';
import 'details_list.dart';
import '../app_colors.dart';
import 'details_list/details_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (_, boxConstraints){
          final isMobile = boxConstraints.maxWidth < 800;
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20 ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isMobile? boxConstraints.maxWidth*0.9 : boxConstraints.maxWidth*0.8),
                child: Container(
                  // margin: const EdgeInsets.fromLTRB(200.0, 20.0, 200.0, 80.0),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColorWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: AppColors.borderColorWhite,
                      width: 1.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(30.0),
                          decoration: const BoxDecoration(
                            color: AppColors.backgroundColorWhite,
                          ),
                          child: const Text(
                            'Work Diary',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: AppColors.eggPlant,
                            ),
                          ),
                        ),
                        // Add Divider widget here
                        const Divider(
                          color: AppColors.borderColorWhite,
                          thickness: 1,
                          height: 1,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            calendarContainer(context),
                            isMobile? const SizedBox() : const SizedBox(
                              height: 580,
                              child: VerticalDivider(
                                color: AppColors.borderColorWhite,
                                thickness: 1,
                                width: 1,
                              ),
                            ),
                           isMobile? const SizedBox() : Expanded(
                             child: detailsDisplay(),
                           )
                          ],
                        ),
                        isMobile?
                        const Divider(
                          color: AppColors.borderColorWhite,
                          thickness: 1,
                          height: 1,
                        ) : const SizedBox(),
                        isMobile? Center(child: detailsDisplay(),) : const SizedBox()
                      ],
                    ),
                  ),
                ),
              )
            ),
          );
        },
        )
      ),
    );
  }

  ConstrainedBox calendarContainer(BuildContext context){
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 250,
        maxWidth: 300,
        maxHeight: 450,
      ),
      child: CalenderDisplayPage(
        onWeekSelected: (dates) async {
          final detailsData = Provider.of<DetailsData>(
            context,
            listen: false,
          );
          detailsData.filterByWeek(dates[0], dates[1]);
        },
      ),
    );
  }
  ConstrainedBox detailsDisplay() {
    return ConstrainedBox(constraints: const BoxConstraints(
        maxWidth: 420,
        minWidth: 400,
        maxHeight: 580
    ),
      child: const DetailsList(),
    );
  }
}
