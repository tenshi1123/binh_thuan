import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:binh_thuan/modules/lesson_details/test_screen.dart';
import 'package:binh_thuan/modules/videoplayer/animation_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({super.key});

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
                  SvgPicture.asset('assets/icons/three_dots_icon.svg'),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const ItemDetails(),
              _tabSection(context),
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
                      //startTimer();
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
  const ItemDetails({super.key});

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
            'Bài 8: Lorem ipsum dolor sit amet',
            style: defaultBoldText,
          ),
          Divider(
            color: keyBlack,
            indent: 0.w,
            endIndent: 240.w,
          ),
          Text(
            'Nội dung ',
            style: defaultBoldText.copyWith(fontSize: 14.sp),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            style: defaultText14,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
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
          Text(
            '• Lorem ipsum',
            style: defaultText14,
          ),
          Text(
            '• Seo do eiusm',
            style: defaultText14,
          ),
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
                '  07:15 - 08:00 ',
                style: defaultText14,
              ),
              SizedBox(
                width: 20.w,
              ),
              SvgPicture.asset(
                'assets/icons/teacher_icon.svg',
                color: keyBlack,
              ),
              Text(
                '  HươngNN',
                style: defaultText14,
              ),
              SizedBox(
                width: 20.w,
              ),
              SvgPicture.asset(
                'assets/icons/book_online.svg',
                color: keyBlack,
              ),
              Text(
                '  Online',
                style: defaultText14,
              ),
            ],
          ),
          Text(
            '    Tiết 1',
            style: defaultText14,
          ),
        ],
      ),
    );
  }
}

Widget _tabSection(BuildContext context) {
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
          child: const TabBarView(children: [
            DocumentTab(),
            MissionItem(),
            QuestionTab(),
          ]),
        ),
      ],
    ),
  );
}

class DocumentTab extends StatelessWidget {
  const DocumentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return const DocumentItem();
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
  const DocumentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AnimationPlayer(),
          ),
        );
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
                  'Lorem ipsum',
                  style: defaultBoldText,
                ),
                Text(
                  'Video',
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
  const QuestionTab({super.key});

  @override
  State<QuestionTab> createState() => _QuestionTabState();
}

class _QuestionTabState extends State<QuestionTab> {
  TextEditingController? questionController = TextEditingController();
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
                //height: 60.h,
                child: TextField(
                  style: defaultText16,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  //keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  controller: questionController,
                  //focusNode: _focusNode,
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
                onTap: () {
                  questionController?.clear();
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
