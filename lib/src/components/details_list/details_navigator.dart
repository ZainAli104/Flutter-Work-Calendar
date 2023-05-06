import 'package:first_project/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class DetailsNavigator extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailsNavigator({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 24,
                                      color: AppColors.eggPlant,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  // '${data['title']}',
                                  'Monday, May 2',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.eggPlant,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          child: CustomHeaderList(
                            header: data['trackTime'],
                            list: [
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomHeaderList extends StatelessWidget {
  final String header;
  final List<Map<String, dynamic>> list;

  const CustomHeaderList({Key? key, required this.header, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime startTime = list.first['time'];
    DateTime endTime = list.last['time'];
    String formattedStartTime = DateFormat('hh:mm a').format(startTime);
    String formattedEndTime = DateFormat('hh:mm a').format(endTime);

    Duration duration = endTime.difference(startTime);
    String formattedDuration =
        '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}';

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColorWhite),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 23, 23, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                Text(
                  'Total: $header',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackCoffee,
                  ),
                ),
                const SizedBox(width: 8),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      // callback function for tap event
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: AppColors.greenTwik,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  margin: const EdgeInsets.only(left: 11.0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.greenTwik,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'Tracked ($header)',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(159, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.borderColorWhite,
            thickness: 1,
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.greenTwik,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Text(
                  '$formattedStartTime - $formattedEndTime ($formattedDuration)',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(200, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: list.map((item) {
                DateTime itemTime = item['time'];
                String formattedItemTime =
                    DateFormat('hh:mm a').format(itemTime);
                return SizedBox(
                  width: 150, // Adjust this value as needed
                  child: Column(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: LoadingImage(
                          imageUrl: item['image'],
                          width: 150, // Adjust this value as needed
                          height: 100, // Adjust this value as needed
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      LinearProgressIndicator(
                        value: item['progress'] / 100,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        formattedItemTime,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: AppColors.eggPlant,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingImage extends StatefulWidget {
  final String imageUrl;
  final double width;
  final double height;

  const LoadingImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _LoadingImageState createState() => _LoadingImageState();
}

class _LoadingImageState extends State<LoadingImage> {
  late Future<bool> _loadingFuture;

  Future<bool> _loadImage() async {
    final Completer<bool> completer = Completer();
    final ImageStream stream = NetworkImage(widget.imageUrl).resolve(
      const ImageConfiguration(),
    );

    final listener = ImageStreamListener((_, __) {
      completer.complete(true);
    }, onError: (dynamic _, StackTrace? __) {
      completer.complete(false);
    });

    stream.addListener(listener);
    completer.future.then((_) => stream.removeListener(listener));

    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    _loadingFuture = _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _loadingFuture,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Image.network(
            widget.imageUrl,
            width: widget.width,
            height: widget.height,
          );
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
