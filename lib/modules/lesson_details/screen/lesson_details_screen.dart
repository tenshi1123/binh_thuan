import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/models/lesson_model.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:binh_thuan/modules/lesson_details/test_screen.dart';
import 'package:binh_thuan/modules/videoplayer/youtube_player.dart';
import 'package:binh_thuan/repo/repo/lesson_repo.dart';
import 'package:binh_thuan/repo/repo/subject_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:url_launcher/url_launcher.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({
    super.key,
    required this.chiTiet,
    required this.document,
    required this.id,
    required this.listQuestion,
  });

  final ChiTietBuoiHocModel chiTiet;
  final List<DocumentModel> document;
  final String id;
  final List<QuestionModel> listQuestion;
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
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '  Chi tiết buổi học ',
                      style: defaultBoldText.copyWith(fontSize: 14.sp),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pop(),
                    ),
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
                widget.chiTiet,
                widget.id,
                widget.listQuestion,
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         showDialog(
              //           context: context,
              //           builder: (BuildContext context) {
              //             return CupertinoAlertDialog(
              //               title: const Text('Chức năng đang phát triển'),
              //               content: const Text(
              //                   'Đây là chức năng mở sang lớp học zoom'),
              //               actions: <Widget>[
              //                 CupertinoDialogAction(
              //                   isDefaultAction: true,
              //                   child: const Text(
              //                     'Yes',
              //                     style: TextStyle(
              //                         fontSize: 20, color: kPrimaryColor),
              //                   ),
              //                   onPressed: () {
              //                     Navigator.of(context, rootNavigator: true)
              //                         .pop(
              //                       (_) => false,
              //                     );
              //                   },
              //                 )
              //               ],
              //             );
              //           },
              //         );
              //       },
              //       child: Container(
              //         height: 57.h,
              //         width: 350.w,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(8.r),
              //             ),
              //             border: Border.all(
              //               color: Colors.white,
              //             ),
              //             color: rec21Red),
              //         child: Center(
              //           child: Text(
              //             'Vào lớp',
              //             style: defaultBoldText.copyWith(
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
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
              Flexible(
                child: Text(
                  ' ${chiTiet.info.teacherName}',
                  style: defaultText14,
                  maxLines: 2,
                ),
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
  ChiTietBuoiHocModel chiTiet,
  String id,
  List<QuestionModel> listQuestion,
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
              taiLieu: chiTiet.document,
              video: chiTiet.info.videoContent,
            ),
            const MissionItem(),
            QuestionTab(
              id: id,
              listQuestions: listQuestion,
            ),
          ]),
        ),
      ],
    ),
  );
}

class DocumentTab extends StatelessWidget {
  const DocumentTab({
    super.key,
    required this.taiLieu,
    required this.video,
  });
  final List<DocumentModel> taiLieu;
  final String video;
  @override
  Widget build(BuildContext context) {
    if (taiLieu.isEmpty && video == '') {
      return Center(
        child: Text(
          'Không có tài liệu',
          style: defaultText14,
        ),
      );
    }
    return Column(
      children: [
        DocumentItem(
          // videoLesson: videoLesson[index],
          videoContent: video, isVideo: true,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: taiLieu.length,
            itemBuilder: (BuildContext context, int index) {
              return DocumentItem(
                // videoLesson: videoLesson[index],
                taiLieu: taiLieu[index], videoContent: '',
              );
            },
          ),
        ),
      ],
    );
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
        1,
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
  const DocumentItem({
    super.key,
    this.videoLesson,
    this.taiLieu,
    this.isVideo = false,
    required this.videoContent,
  });
  final LessonModels? videoLesson;
  final DocumentModel? taiLieu;
  final String videoContent;
  final bool isVideo;

  @override
  Widget build(BuildContext context) {
    List<String> videoValue = videoContent.split("\" title=\"");
    return GestureDetector(
      onTap: () async {
        if (taiLieu != null) {
          // if (taiLieu!.fileType == 'Word Document') {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const WebViewExample(),
          //     ),
          //   );
          // } else
          SubjectRepo().viewDocument(id: taiLieu?.id ?? '');
          if (taiLieu!.urlFile.contains('pdf')) {
            if (!await launchUrl(Uri.parse(
                'https://drive.google.com/viewerng/viewer?embedded=true&url=${taiLieu!.urlFile}'))) {
              throw Exception('Could not launch ');
            }
          } else {
            if (!await launchUrl(Uri.parse(
                'https://view.officeapps.live.com/op/embed.aspx?src=${taiLieu!.urlFile}'))) {
              throw Exception('Could not launch ');
            }
          }
        } else {
          pushWithoutNavBar(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  YoutubePlayerDemoApp(videoValue: videoValue),
            ),
          );
        }
      },
      child: Container(
        width: 350.w,
        height: 83.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        margin: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
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
              child: SvgPicture.asset(
                  isVideo
                      ? 'assets/icons/video_icon.svg'
                      : 'assets/icons/home_work_icon.svg',
                  width: 18.w,
                  height: 18.h,
                  fit: BoxFit.fill),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  isVideo
                      ? videoContent != ''
                          ? videoValue[1]
                          : videoLesson!.name
                      : taiLieu!.name,
                  style: defaultBoldText,
                ),
                Text(
                  isVideo ? 'video' : taiLieu!.fileType,
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
  const QuestionTab({
    super.key,
    required this.id,
    required this.listQuestions,
  });
  final String id;
  final List<QuestionModel> listQuestions;
  @override
  State<QuestionTab> createState() => _QuestionTabState();
}

class _QuestionTabState extends State<QuestionTab> {
  final TextEditingController questionController = TextEditingController();
  late List<QuestionModel> listQuestions;
  @override
  void initState() {
    listQuestions = widget.listQuestions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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

                    // setState(() {
                    //   widget.listQuestions.insert(
                    //     0,
                    //     QuestionModel(
                    //         question: questionController.text,
                    //         answer: '',
                    //         createdAt: '',
                    //         updateAt: ''),
                    //   );
                    // });
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
                                style: TextStyle(
                                    fontSize: 20, color: kPrimaryColor),
                              ),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop(
                                  (_) => false,
                                );
                                Navigator.of(context).pop();
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listQuestions.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 50.h),
              physics: const ClampingScrollPhysics(),
              //reverse: true,
              //physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 6, bottom: 6),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: kPrimaryColor),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Column(
                            children: [
                              Text(
                                listQuestions[index].question,
                                style: defaultText14.copyWith(color: keyWhite),
                              ),
                              Text(
                                listQuestions[index].createdAt.substring(5, 16),
                                style: defaultText14.copyWith(
                                  color: keyWhite,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                      listQuestions[index].answer == ''
                          ? const SizedBox()
                          : Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 300),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: rec14Marine,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Text(
                                  listQuestions[index].answer,
                                  style: defaultText14.copyWith(
                                    color: keyBlack,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
