import 'dart:async';
import 'dart:io';
import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/exercise/exercise_model.dart';
import 'package:binh_thuan/repo/repo/excercise_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:number_paginator/number_paginator.dart';

extension Substrings on String {
  /// Drops the last n characters.
  String dropLast(int n) {
    return n > length ? "" : substring(0, length - n);
  }
}

class TestDetailScreen extends StatefulWidget {
  const TestDetailScreen(
      {super.key, required this.listQuiz, required this.model});
  final List<QuizModel> listQuiz;
  final ExcerciseModel model;
  @override
  State<TestDetailScreen> createState() => _TestDetailScreenState();
}

class _TestDetailScreenState extends State<TestDetailScreen> {
  //int _currentPage = 1;
  //@override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Pagination Example"),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: 200,
  //             margin: const EdgeInsets.all(32),
  //             color: Colors.blue,
  //             child: Center(
  //               child: Text(
  //                 "PAGE: $_currentPage",
  //                 style: const TextStyle(color: Colors.white, fontSize: 20),
  //               ),
  //             ),
  //           ),
  //           Pager(
  //             currentPage: _currentPage,
  //             totalPages: 5,
  //             onPageChanged: (page) {
  //               setState(() {
  //                 _currentPage = page;
  //               });
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  var countdownDuration = const Duration(minutes: 15);
  Duration duration = const Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;
  int _currentPage = 0;
  bool? isChecked = false;
  List<File> photos = <File>[];
  final ValueNotifier<Map<int, int>> _counter =
      ValueNotifier<Map<int, int>>({});
  late List<QuizModel> _listQuiz;
  late List<Map<String, String>> _listAnswers;
  @override
  void initState() {
    // TODO: implement initState
    _listQuiz = widget.listQuiz;
    _listAnswers = List<Map<String, String>>.from(
      widget.listQuiz.map(
        (e) => {"id": e.id, "answer": ""},
      ),
    );
    int hours1;
    int mints1;
    int secs1;
    hours1 = int.parse("00");
    mints1 = int.parse("15");
    secs1 = int.parse("00");
    countdownDuration =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer();
    reset();
    super.initState();
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickMultiImage();
    photos = List<File>.from(
      (returnedImage).map(
        (e) => File(e.path),
      ),
    );
    //File(returnedImage!.path);
    if (photos.isNotEmpty) {
      //do something
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      _listQuiz.length,
      (index) => SizedBox(
        height: 600.h,
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (BuildContext context, value, Widget? child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 21.h,
                        width: 21.w,
                        decoration: const BoxDecoration(
                          color: keyBlack,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: defaultText16.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 304.w,
                        child: Text(
                          _listQuiz[index].title,
                          style: defaultText16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: HtmlWidget(
                      _listQuiz[index].content,
                      textStyle: defaultText12,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 390.w,
                    //height: 400.h,
                    child: _listQuiz[index].questions == ''
                        ? Text(
                            'Trả lời câu hỏi ở trang tiếp theo',
                            style: defaultText16,
                            textAlign: TextAlign.center,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                            //itemExtent: 90,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _listQuiz[index].type == '4'
                                ? _listQuiz[index]
                                    .questions
                                    .trim()
                                    .split(",")
                                    .length
                                : _listQuiz[index]
                                        .questions
                                        .trim()
                                        .split(",")
                                        .length ~/
                                    2,
                            itemBuilder: (BuildContext context, int answer) {
                              return GestureDetector(
                                onTap: () {
                                  // dùng tạm cách này đi
                                  //_counter.value[index] = answer;
                                  _counter.value.addAll({index: answer});
                                  _counter.notifyListeners();
                                  _listAnswers[_listAnswers.indexWhere((e) =>
                                      e['id'] == _listQuiz[index].id)] = {
                                    "id": _listQuiz[index].id,
                                    "answer": answer.toString(),
                                  };
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  decoration: BoxDecoration(
                                    // border: Border.all(),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.r),
                                    ),
                                    color: _counter.value[index] == answer
                                        ? rec14Marine
                                        : Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Checkbox(
                                        //tristate: true,
                                        value: _counter.value[index] == answer,
                                        shape: const CircleBorder(),
                                        onChanged: (bool? value) {
                                          _counter.value[index] = answer;
                                        },
                                      ),
                                      SizedBox(
                                        width: 304.w,
                                        child:
                                            //check type of answer
                                            _listQuiz[index].type == '4'
                                                ? Text(
                                                    _listQuiz[index]
                                                        .questions
                                                        .trim()
                                                        .split(",")[answer],
                                                    style: defaultText16,
                                                  )
                                                :
                                                // Text(
                                                //     _listQuiz[index]
                                                //         .questions
                                                //         .trim()
                                                //         .split(",")[answer * 2],
                                                //     style: defaultText16,
                                                //   ),
                                                // Text(
                                                //     _listQuiz[index]
                                                //         .questions
                                                //         .trim()
                                                //         .split(",")[answer * 2]
                                                //         .replaceAll(
                                                //             RegExp(
                                                //                 r'"|text|{|:|\['),
                                                //             ''),
                                                //     style: defaultText16,
                                                //   ),
                                                HtmlWidget(
                                                    _listQuiz[index]
                                                        .questions
                                                        .trim()
                                                        .split(",")[answer * 2]
                                                        .replaceAll(
                                                            RegExp(
                                                                r'"|text|{|:|\['),
                                                            '')
                                                    //.dropLast(9)
                                                    ,
                                                    textStyle: defaultText16,
                                                  ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                  ),

                  // const Answer(
                  //   title:
                  //       'B. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
                  // ),
                  // const Answer(
                  //   title:
                  //       'C. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
                  // ),
                  // const Answer(
                  //   title:
                  //       'D. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          widget.model.name,
          style: defaultBoldText.copyWith(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thời gian còn lại',
                  style: defaultBoldText,
                ),
                buildTime1(),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                await ExcerciseRepo().submitTest(
                  id: '',
                  statTime: DateFormat('yyyy-MM-dd HH:mm').format(
                    DateTime.now(),
                  ),
                  data: _listAnswers,
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text('Bài làm đã được gửi'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: const Text(
                            'ok',
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 35.h,
                width: 74.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10.r,
                    ),
                  ),
                  color: rec21Red,
                ),
                child: Center(
                  child: Text(
                    'Nộp bài',
                    style: defaultBoldText.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),

        // Container(
        //   width: 350.w,
        //   height: 110.h,
        //   padding: EdgeInsets.symmetric(horizontal: 10.w),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(8.r)),
        //     boxShadow: [
        //       BoxShadow(
        //         color: kPrimaryColor.withOpacity(0.2),
        //         spreadRadius: 5,
        //         blurRadius: 7,
        //         offset: const Offset(4, 7), // changes position of shadow
        //       ),
        //     ],
        //     color: Colors.white,
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         'Đề bài:',
        //         style: defaultBoldText,
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 20.h,
        ),
        pages[_currentPage],
      ]),
      // card for elevation
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: NumberPaginator(
          // by default, the paginator shows numbers as center content
          numberPages: _listQuiz.length,
          onPageChange: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(
        time: hours,
      ),
      Text(
        ':',
        style: defaultBoldText.copyWith(
          color: rec21Red,
          fontSize: 20.sp,
        ),
      ),
      buildTimeCard(
        time: minutes,
      ),
      Text(
        ':',
        style: defaultBoldText.copyWith(
          color: rec21Red,
          fontSize: 20.sp,
        ),
      ),
      buildTimeCard(
        time: seconds,
      ),
    ]);
  }

  Widget buildTimeCard({
    required String time,
  }) =>
      Text(
        time,
        style: defaultBoldText.copyWith(
          color: rec21Red,
          fontSize: 20.sp,
        ),
      );
}

class Answer extends StatefulWidget {
  const Answer({super.key, required this.title});
  final String title;
  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Checkbox(
          //tristate: true,
          value: isChecked,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        SizedBox(
          width: 304.w,
          child: Text(
            widget.title,
            style: defaultText16,
          ),
        ),
      ],
    );
  }
}
