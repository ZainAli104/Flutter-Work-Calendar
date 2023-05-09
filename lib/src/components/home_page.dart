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
      body: Container(
        margin: const EdgeInsets.fromLTRB(200.0, 20.0, 200.0, 80.0),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Expanded(
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 400,
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
                    ),
                    const VerticalDivider(
                      color: AppColors.borderColorWhite,
                      thickness: 1,
                      width: 1,
                    ),
                    const Expanded(
                      flex: 2,
                      child: DetailsList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
