import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/course/subject_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tab_container/tab_container.dart';

class NestedScroll extends StatelessWidget {
  const NestedScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                flexibleSpace: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          SvgPicture.asset(
                            'assets/icons/three_stick_icon.svg',
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          SvgPicture.asset(
                            'assets/icons/message_icon.svg',
                          ),
                          SizedBox(
                            width: 220.w,
                          ),
                          Container(
                            height: 32.h,
                            width: 65.w,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: kPrimaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '  04',
                                  style: defaultText12.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                SvgPicture.asset('assets/icons/noti_icon.svg')
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        '\t    Sắp diễn ra',
                        style: defaultText16.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito-Bold'),
                      ),
                      SizedBox(
                        width: 380.w,
                        height: 111.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(8),
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return const CommingLesson();
                            }),
                      ),
                      Text(
                        '\t    Khóa học của tôi',
                        style:
                            defaultText16.copyWith(fontFamily: 'Nunito-Bold'),
                      ),
                    ],
                  ),
                ),
                pinned: false,
                toolbarHeight: 220.h,
                forceElevated: innerBoxIsScrolled,
                // bottom: TabBar(
                //   tabs: tabs.map((String name) => Tab(text: name)).toList(),
                // ),
                backgroundColor: Colors.white,
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(color: Colors.grey.shade300),
          width: 390.w,
          child: AspectRatio(
            aspectRatio: 10 / 8,
            child: TabContainer(
              borderRadius: BorderRadius.circular(20),
              tabBorderRadius: BorderRadius.circular(30),
              tabEdge: TabEdge.top,
              curve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                animation =
                    CurvedAnimation(curve: Curves.easeIn, parent: animation);
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.2, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              color: Colors.white,
              selectedTextStyle: defaultText16,
              unselectedTextStyle: defaultText12.copyWith(color: kPrimaryColor),
              tabs: getTabs1(),
              children: getChildren1(),
            ),
          ),
        ),
      ),
    );
  }
}

const List<String> tabs = <String>['Tất cả', 'Đang học', 'Chờ', 'Hoàn thành'];
List<Widget> getTabs1() {
  return tabs
      .map((e) => Text(
            e,
          ))
      .toList();
}

List<Widget> getChildren1() {
  return tabs.map((String name) {
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
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverFixedExtentList(
                  itemExtent: 136.h,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h,
                        ),
                        child: InkWell(
                            onTap: () {
                              pushWithNavBar(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SubjectScreen()));
                            },
                            child: const CourseItem()),
                      );
                    },
                    childCount: 5,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }).toList();
}

class CommingLesson extends StatelessWidget {
  const CommingLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: 200.w,
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(6),
            height: 76.h,
            width: 76.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              color: const Color(0xffF7926E),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Thứ 6',
                  style: defaultText12.copyWith(
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 1.h,
                  width: 42.w,
                  color: Colors.white,
                ),
                Text(
                  '27',
                  style: defaultText20.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'tháng 4',
                  style: defaultText12.copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            height: 80.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Toán',
                  style: defaultText16.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/time_icon.svg'),
                    Text(
                      ' 07:15 - 08:00',
                      style: defaultText12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/bookmark.svg'),
                    Text(
                      ' Buổi 9',
                      style: defaultText12,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.w,
          top: 0.h,
          child: Image(
            height: 117.h,
            width: 350.w,
            image: const AssetImage('assets/images/course_bg1.png'),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Text(
            'Chờ thanh toán',
            style: defaultText12.copyWith(
              fontFamily: 'Nunito-Bold',
            ),
          ),
        ),
        Positioned(
          bottom: 5.h,
          left: 8.w,
          child: Text(
            'Hình thức: Online',
            style: defaultText16.copyWith(
              fontFamily: 'Nunito-Bold',
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 25.h,
          left: 8.w,
          child: Text(
            'Giáo viên: --',
            style: defaultText16.copyWith(
              fontFamily: 'Nunito-Bold',
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 5.h,
          left: 8.w,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              ' Địa lý ',
              style: defaultText16.copyWith(
                fontFamily: 'Nunito-Bold',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
