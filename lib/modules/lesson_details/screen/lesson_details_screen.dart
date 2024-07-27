import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/models/lesson_model.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:binh_thuan/modules/lesson_details/test_screen.dart';
import 'package:binh_thuan/repo/repo/lesson_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({
    super.key,
    required this.videoLesson,
    required this.chiTiet,
    required this.document,
    required this.id,
  });
  final List<LessonModels> videoLesson;
  final ChiTietBuoiHocModel chiTiet;
  final List<DocumentModel> document;
  final String id;
  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  // late Timer _timer;
  // int _start = 200;
  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }

  @override
  void dispose() {
    //_timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '<',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: '  Chi tiết buổi học ',
                            style: defaultBoldText.copyWith(fontSize: 14.sp),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context).pop(),
                          )
                        ]),
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  //SvgPicture.asset('assets/icons/three_dots_icon.svg'),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ItemDetails(
                chiTiet: widget.chiTiet,
              ),
              _tabSection(
                context,
                widget.videoLesson,
                widget.chiTiet,
                widget.id,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 250.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    // Text(
                    //   "$_start",
                    //   style: defaultBoldText,
                    // ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text('Chức năng đang phát triển'),
                            content: const Text(
                                'Đây là chức năng mở sang lớp học zoom'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                      fontSize: 20, color: kPrimaryColor),
                                ),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(
                                    (_) => false,
                                  );
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 57.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                          border: Border.all(
                            color: Colors.white,
                          ),
                          color: rec21Red),
                      child: Center(
                        child: Text(
                          'Vào lớp',
                          style: defaultBoldText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.chiTiet});
  final ChiTietBuoiHocModel chiTiet;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 279.h,
      padding: EdgeInsets.only(left: 20.w, top: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: kPrimaryColor,
            width: 20.w,
            style: BorderStyle.solid,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(4, 4.5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chiTiet.info.name,
            style: defaultBoldText,
          ),
          Divider(
            color: keyBlack,
            indent: 0.w,
            endIndent: 240.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Chuẩn bị',
            style: defaultBoldText.copyWith(fontSize: 14.sp),
          ),
          SizedBox(
            height: 6.h,
          ),
          (chiTiet.document.isEmpty)
              ? Text(
                  'Không có tài liệu cần chuẩn bị',
                  style: defaultText14,
                )
              : SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: chiTiet.document.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          '• ${chiTiet.document[0].name}',
                          style: defaultText14,
                        );
                      }),
                ),
          // Text(
          //     '• ${chiTiet.document[0].name}',
          //     style: defaultText14,
          //   ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/time_icon.svg',
                color: keyBlack,
              ),
              Text(
                ' ${chiTiet.info.timeStart} - ${chiTiet.info.timeEnd} ',
                style: defaultText14,
              ),
              SizedBox(
                width: 40.w,
              ),
              SvgPicture.asset(
                'assets/icons/teacher_icon.svg',
                color: keyBlack,
              ),
              Text(
                ' ${chiTiet.info.teacherName}',
                style: defaultText14,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '    ${chiTiet.info.timeType}',
                style: defaultText14,
              ),
              SizedBox(
                width: 84.w,
              ),
              SvgPicture.asset(
                'assets/icons/book_online.svg',
                color: keyBlack,
              ),
              Text(
                ' ${chiTiet.info.hinhThuc}',
                style: defaultText14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _tabSection(
  BuildContext context,
  List<LessonModels> videoLesson,
  ChiTietBuoiHocModel chiTiet,
  String id,
) {
  return DefaultTabController(
    length: 3,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TabBar(
            unselectedLabelColor: keyBlack.withOpacity(0.3),
            labelColor: keyBlack,
            indicatorColor: keyBlack,
            tabs: [
              homeTab(title: "Tài liệu", isSeprator: false, hasNumber: false),
              homeTab(title: "Nhiệm vụ", hasNumber: false),
              homeTab(title: "Thắc mắc", hasNumber: false),
            ]),
        SizedBox(
          //Add this to give height
          height: MediaQuery.of(context).size.height * 0.4,
          child: TabBarView(children: [
            DocumentTab(
              videoLesson: videoLesson,
              taiLieu: chiTiet.document,
            ),
            const MissionItem(),
            QuestionTab(
              id: id,
            ),
          ]),
        ),
      ],
    ),
  );
}

class DocumentTab extends StatelessWidget {
  const DocumentTab(
      {super.key, required this.videoLesson, required this.taiLieu});
  final List<LessonModels> videoLesson;
  final List<DocumentModel> taiLieu;
  @override
  Widget build(BuildContext context) {
    if (taiLieu.isEmpty) {
      return Center(
        child: Text(
          'Không có tài liệu',
          style: defaultText14,
        ),
      );
    }
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        itemCount: taiLieu.length,
        itemBuilder: (BuildContext context, int index) {
          return DocumentItem(
            videoLesson: videoLesson,
            taiLieu: taiLieu[index],
          );
        });
  }
}

class MissionItem extends StatelessWidget {
  const MissionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (169.w / 98.h),
      children: List.generate(
        5,
        (i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TestScreen(),
                ),
              );
            },
            child: Container(
              width: 169.w,
              height: 98.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:
                          const Offset(4, 4.5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          color: rec27Teal,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.r),
                          ),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/home_work_icon.svg',
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Test 1',
                            style: defaultBoldText,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/time_icon.svg'),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                '15 phút',
                                style: defaultText14,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: rec27Teal,
                  ),
                  Text(
                    'Trắc nghiệm',
                    style: defaultText14,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DocumentItem extends StatelessWidget {
  const DocumentItem(
      {super.key, required this.videoLesson, required this.taiLieu});
  final List<LessonModels> videoLesson;
  final DocumentModel taiLieu;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(Uri.parse(taiLieu.urlFile))) {
          throw Exception('Could not launch ');
        }
      },
      child: Container(
        width: 350.w,
        height: 83.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(4, 4.5), // changes position of shadow
              ),
            ],
            color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 45.w,
              height: 45.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    6.r,
                  ),
                ),
              ),
              child: SvgPicture.asset('assets/icons/video_icon.svg',
                  width: 18.w, height: 18.h, fit: BoxFit.fill),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  taiLieu.name,
                  style: defaultBoldText,
                ),
                Text(
                  taiLieu.fileType,
                  style: defaultText14.copyWith(color: color999),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionTab extends StatefulWidget {
  const QuestionTab({super.key, required this.id});
  final String id;

  @override
  State<QuestionTab> createState() => _QuestionTabState();
}

class _QuestionTabState extends State<QuestionTab> {
  final TextEditingController questionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          width: 350.w,
          child: Row(
            children: [
              SizedBox(
                width: 320.w,
                child: TextField(
                  style: defaultText16,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  minLines: 1,
                  maxLines: 5,
                  controller: questionController,
                  scrollPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).viewInsets.bottom),
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText:
                        'Gửi thắc mắc và câu hỏi về bài học cho giáo viên',
                    hintStyle: defaultText12.copyWith(
                      color: rec12Marine,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await LessonRepo().sendQuestion(
                      id: widget.id, content: questionController.text);
                  questionController.clear();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: const Text('Gửi thành công'),
                        content: const Text('Thắc mắc đã được gửi đi'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: const Text(
                              'Yes',
                              style:
                                  TextStyle(fontSize: 20, color: kPrimaryColor),
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop(
                                (_) => false,
                              );
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                child: SvgPicture.asset('assets/icons/plane.svg'),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          indent: 20.w,
          endIndent: 20.w,
        )
      ],
    );
  }
}
