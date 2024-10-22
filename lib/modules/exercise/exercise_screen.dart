import 'dart:math';
import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/exercise/details_exercise.dart';
import 'package:binh_thuan/repo/repo/excercise_repo.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'exercise_model.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key, required this.listExercises});
  final List<ExcerciseModel> listExercises;
  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Toàn bộ', 'Chưa làm', 'Hoàn thành'];
    List<ExcerciseModel> unfinshed =
        listExercises.where((o) => o.checkId == '').toList();
    List<ExcerciseModel> finshed =
        listExercises.where((o) => o.checkId != '').toList();
    final Map<String, List<ExcerciseModel>> mapExcercise = {
      'Toàn bộ': listExercises,
      'Chưa làm': unfinshed,
      'Hoàn thành': finshed,
    };
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: Image(
                            height: 140.h,
                            width: MediaQuery.of(context).size.width,
                            image: const AssetImage(
                                'assets/images/appbar_background.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 140.w,
                          top: 80.h,
                          child: Text(
                            'Bài tập',
                            style: defaultText20.copyWith(
                              color: keyWhite,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Nunito-Bold',
                            ),
                          ),
                        ),
                        // Positioned(
                        //   top: 150.h,
                        //   child: Text(
                        //     '\t    Sắp đến hạn',
                        //     style: defaultText16.copyWith(
                        //         fontWeight: FontWeight.bold,
                        //         fontFamily: 'Nunito-Bold'),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: 170.h,
                        //   child: SizedBox(
                        //     width: 380.w,
                        //     height: 100.h,
                        //     child: ListView.builder(
                        //         scrollDirection: Axis.horizontal,
                        //         padding: const EdgeInsets.all(8),
                        //         itemCount: 4,
                        //         itemBuilder: (BuildContext context, int index) {
                        //           //return const CommingLesson();
                        //           return const IsComingItem(
                        //             entries: ['Tự luận', 'Về nhà'],
                        //             color: Color(0xff85DDE0),
                        //             title: 'Bài 3: dolor sit amet',
                        //             time: 'Còn: 1 giờ',
                        //           );
                        //         }),
                        //   ),
                        // ),
                        Positioned(
                          left: 10.w,
                          top: 80.h,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  snap: false,
                  stretch: true,
                  toolbarHeight: 120.h,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    isScrollable: true,
                    indicatorColor: keyBlack,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.w), //hight of indicator
                      insets: EdgeInsets.symmetric(
                          horizontal: 20
                              .w), //give some padding to reduce the size of indicator
                    ),
                    unselectedLabelColor: keyBlack.withOpacity(0.3),
                    labelColor: keyBlack,

                    tabs: _tabScroll(), //list of tabs
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 88.h,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ExerciseItem(
                                  model: mapExcercise[name]![index],
                                );
                              },
                              childCount: mapExcercise[name]?.length ?? 0,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class IsComingItem extends StatelessWidget {
  final List<String> entries;
  final Color color;
  final String title;
  final String time;
  const IsComingItem(
      {super.key,
      required this.entries,
      required this.color,
      required this.title,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const DetailsExercise(),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.h),
        width: 177.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 36.h,
              width: 160.w,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      height: 10.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      margin: EdgeInsets.only(left: 8.h),
                      child: Center(
                        child: Text(
                          entries[index],
                          style: defaultBoldText.copyWith(
                            fontSize: 12.sp,
                            color: color,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.h),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 8.h),
            //   padding: EdgeInsets.only(left: 6.h),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(16.r),
            //     ),
            //   ),
            //   width: 90.w,
            //   child: Row(
            //     children: [
            //       const Icon(
            //         Icons.timer,
            //         color: keyBlack,
            //       ),
            //       Text(
            //         time,
            //         style: defaultText12,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget homeTab(
    {required String title,
    bool isSeprator = true,
    bool hasNumber = true,
    int count = 0}) {
  return Tab(
    child: Container(
      // width: 130.w,
      height: 30.h,
      decoration: isSeprator
          ? const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Text(title),
          hasNumber
              ? Container(
                  decoration: BoxDecoration(
                    color: keyBlack,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  margin: EdgeInsets.only(left: 8.h),
                  child: Center(
                    child: Text(
                      '$count',
                      style: defaultText12.copyWith(color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}

List<Widget> _tabScroll() => [
      homeTab(title: "Toàn bộ", isSeprator: false),
      homeTab(title: "Chưa làm"),
      homeTab(title: "Hoàn thành"),
    ];
final _random = Random();

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key, required this.model});
  final ExcerciseModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (model.checkId == "") {
          List<QuizModel> listQuiz =
              await ExcerciseRepo().getListQuestion(model.id);
          if (listQuiz.isNotEmpty) {
            AppRouter.toPage(
              context,
              AppPages.TestDetailPage,
              arguments: {
                'listQuiz': listQuiz,
                'model': model,
              },
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsExercise(
                  model: model,
                ),
              ),
            );
          }
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text('Bạn đã làm bài tập này'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text(
                      'Đồng ý',
                      style: TextStyle(fontSize: 20, color: kPrimaryColor),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        width: 350.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 6.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 4.5), // changes position of shadow
              ),
            ],
            color: Colors.white),
        child: Row(
          children: [
            Container(
              width: 45.w,
              height: 45.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                  color: listColor[_random.nextInt(listColor.length)],
                  shape: BoxShape.circle),
              child: (model.finalMark == '')
                  ? SvgPicture.asset('assets/icons/home_work_icon.svg',
                      width: 18.w, height: 18.h, fit: BoxFit.fill)
                  : Text(
                      model.finalMark,
                      style: defaultText14,
                    ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    model.name,
                    style: defaultBoldText,
                  ),
                ),
                Text(
                  DateFormat("yyyy").format(model.timeDeadline) == '0001'
                      ? 'Không có thời hạn'
                      : DateFormat("dd-MM-yyyy HH:mm")
                          .format(model.timeDeadline),
                  style: defaultText14,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  model.typeExcercise,
                  style: defaultText14,
                ),
                (model.typeExcercise != 'Tự luận')
                    ? Text(
                        '${model.totalTime}phút',
                        style: defaultText14,
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
