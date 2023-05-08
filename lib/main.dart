import 'package:first_project/src/app.dart';
import 'package:first_project/src/components/details_list/details_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DetailsData(),
      child: const MyApp(),
    ),
  );
}
