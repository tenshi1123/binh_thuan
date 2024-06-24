import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TabBar(
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        isScrollable: true,
        indicatorColor: keyBlack,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.w), //hight of indicator
          insets: EdgeInsets.symmetric(
              horizontal:
                  20.w), //give some padding to reduce the size of indicator
        ),
        unselectedLabelColor: keyBlack.withOpacity(0.3),
        labelColor: keyBlack,

        tabs: _tabScroll(), //list of tabs
      ),
      body: TabBarView(
        children: _tabs.map((String name) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  key: PageStorageKey<String>(name),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverFixedExtentList(
                        itemExtent: 83.h,
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return const ExerciseItem();
                          },
                          childCount: 30,
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
    );
  }
}

List<Widget> _tabScroll() => [
      homeTab(title: "Video", isSeprator: false),
      homeTab(title: "PDF"),
      const SizedBox()
    ];
const List<String> _tabs = <String>['Tất cả', 'Đang học', 'Chờ'];
