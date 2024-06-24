import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/course/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabSchedule extends StatelessWidget {
  final String name;
  const TabSchedule({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              key: PageStorageKey<String>(name),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Text(
                    '    Đang diễn ra',
                    style: defaultBoldText,
                  ),
                ),
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
                          child: const CommingLesson(),
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
      ),
    );
  }
}
