import 'package:flutter/material.dart';

class DetailsData extends ChangeNotifier {
  List<Map<String, dynamic>> _data = [
    {
      "date_title": DateTime(2023, 5, 8),
      "progressBar": 40,
      'list': [
        {
          'id': 1,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 20,
          'time': DateTime(2023, 5, 2, 7, 20),
        },
        {
          'id': 2,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 8, 20),
        },
        {
          'id': 3,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 80,
          'time': DateTime(2023, 5, 2, 9, 20),
        },
        {
          'id': 4,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 10, 30),
        },
        {
          'id': 5,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 30,
          'time': DateTime(2023, 5, 2, 11, 50),
        },
        {
          'id': 6,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 90,
          'time': DateTime(2023, 5, 2, 12, 50),
        },
      ],
    },
    {
      "date_title": DateTime(2023, 5, 9),
      "progressBar": 100,
      'list': [
        {
          'id': 1,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 80,
          'time': DateTime(2023, 5, 2, 7, 20),
        },
        {
          'id': 2,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 100,
          'time': DateTime(2023, 5, 2, 8, 20),
        },
        {
          'id': 3,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 100,
          'time': DateTime(2023, 5, 2, 9, 20),
        },
        {
          'id': 4,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 10, 30),
        },
        {
          'id': 5,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 30,
          'time': DateTime(2023, 5, 2, 11, 50),
        },
        {
          'id': 6,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 90,
          'time': DateTime(2023, 5, 2, 12, 50),
        },
        {
          'id': 7,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 70,
          'time': DateTime(2023, 5, 2, 13, 50),
        },
        {
          'id': 7,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 30,
          'time': DateTime(2023, 5, 2, 14, 50),
        },
      ],
    },
    {
      "date_title": DateTime(2023, 5, 10),
      "progressBar": 50,
      'list': [
        {
          'id': 1,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 20,
          'time': DateTime(2023, 5, 2, 7, 20),
        },
        {
          'id': 2,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 8, 20),
        },
        {
          'id': 3,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 80,
          'time': DateTime(2023, 5, 2, 9, 20),
        },
        {
          'id': 4,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 10, 30),
        },
        {
          'id': 5,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 30,
          'time': DateTime(2023, 5, 2, 11, 50),
        },
        {
          'id': 6,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 90,
          'time': DateTime(2023, 5, 2, 12, 50),
        },
      ],
    },
    {
      "date_title": DateTime(2023, 5, 11),
      "progressBar": 20,
      'list': [
        {
          'id': 1,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 20,
          'time': DateTime(2023, 5, 2, 7, 20),
        },
        {
          'id': 2,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 8, 20),
        },
        {
          'id': 3,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 80,
          'time': DateTime(2023, 5, 2, 9, 20),
        },
        {
          'id': 4,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 10, 30),
        },
        {
          'id': 5,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 30,
          'time': DateTime(2023, 5, 2, 11, 50),
        },
        {
          'id': 6,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 90,
          'time': DateTime(2023, 5, 2, 12, 50),
        },
      ],
    },
    {
      "date_title": DateTime(2023, 5, 12),
      "progressBar": 90,
      'list': [
        {
          'id': 1,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 20,
          'time': DateTime(2023, 5, 2, 7, 20),
        },
        {
          'id': 2,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 8, 20),
        },
        {
          'id': 3,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 80,
          'time': DateTime(2023, 5, 2, 9, 20),
        },
        {
          'id': 4,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 10, 30),
        },
        {
          'id': 5,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 30,
          'time': DateTime(2023, 5, 2, 11, 50),
        },
        {
          'id': 6,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 90,
          'time': DateTime(2023, 5, 2, 12, 50),
        },
      ],
    },
    {
      "date_title": DateTime(2023, 5, 13),
      "progressBar": 10,
      'list': [
        {
          'id': 1,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 20,
          'time': DateTime(2023, 5, 2, 7, 20),
        },
        {
          'id': 2,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 8, 20),
        },
        {
          'id': 3,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 80,
          'time': DateTime(2023, 5, 2, 9, 20),
        },
        {
          'id': 4,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 60,
          'time': DateTime(2023, 5, 2, 10, 30),
        },
        {
          'id': 5,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 30,
          'time': DateTime(2023, 5, 2, 11, 50),
        },
        {
          'id': 6,
          'image':
              'https://firebasestorage.googleapis.com/v0/b/next-js-dummy-fcee4.appspot.com/o/ss%201.png?alt=media&token=cae0c084-44df-4552-a406-eb04a5053057',
          'progress': 90,
          'time': DateTime(2023, 5, 2, 12, 50),
        },
      ],
    },
    {
      "date_title": DateTime(2023, 5, 14),
    },
  ];

  List<Map<String, dynamic>> get data => _data;

  set data(List<Map<String, dynamic>> value) {
    _data = value;
    notifyListeners();
  }
}
