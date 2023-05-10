import 'package:first_project/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class DetailsNavigator extends StatelessWidget {
  final Map<String, dynamic> data;
  final List<Map<String, dynamic>> listData;

  const DetailsNavigator({Key? key, required this.data, required this.listData})
      : super(key: key);

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
                                Expanded(child: Text(
                                  DateFormat('EEEE, MMMM d').format(
                                      (data['date_title'] as DateTime?) ??
                                          DateTime.now()),
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.eggPlant,
                                  ),
                                ),)
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          child: CustomHeaderList(
                            list: listData,
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
  final List<Map<String, dynamic>> list;

  const CustomHeaderList({Key? key, required this.list}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String formattedStartTime = '00:00';
    String formattedEndTime = '00:00';
    String formattedDuration = '00:00';
    if (list.isNotEmpty) {
      DateTime startTime = list.first['time'];
      DateTime endTime = list.last['time'];
      formattedStartTime = DateFormat('hh:mm a').format(startTime);
      formattedEndTime = DateFormat('hh:mm a').format(endTime);

      Duration duration = endTime.difference(startTime);
      formattedDuration =
          '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')} hrs';
    }

    return LayoutBuilder(builder: (_,boxConstraints){
      final isMobile = boxConstraints.maxWidth < 430;
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColorWhite),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Text(
                    'Total: $formattedDuration',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 22,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackCoffee,
                    ),
                  ),
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
                  Padding(padding: const EdgeInsets.only(top: 3, left: 15 ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.greenTwik,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                      Text(
                    'Tracked ($formattedDuration)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(159, 0, 0, 0),
                    ),
                  )
                    ],)
                  ),
                ],
              )
            ),
            const Divider(
              color: AppColors.borderColorWhite,
              thickness: 1,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Wrap(
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
                    '$formattedStartTime - $formattedEndTime',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(200, 0, 0, 0),
                    ),
                  ),
                  Text(
                    '($formattedDuration)',
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
                          color: AppColors.greenTwik,
                          backgroundColor: Colors.grey[300],
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
    });
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
