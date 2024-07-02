import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabExercise extends StatelessWidget {
  final String name;
  const TabExercise({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 120.h,
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Positioned(
                top: 10.h,
                child: Text(
                  '\t    Sắp đến hạn',
                  style: defaultText16.copyWith(
                      fontWeight: FontWeight.bold, fontFamily: 'Nunito-Bold'),
                ),
              ),
              Positioned(
                top: 30.h,
                child: SizedBox(
                  width: 380.w,
                  height: 100.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        //return const CommingLesson();
                        return const IsComingItem(
                          entries: ['Tự luận'],
                          color: kPrimaryColor,
                          title: 'Bài 3: Lorem ipsum dolor sit amet',
                          time: 'Còn: 1 giờ',
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
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
                horizontal:
                    20.w), //give some padding to reduce the size of indicator
          ),
          unselectedLabelColor: keyBlack.withOpacity(0.3),
          labelColor: keyBlack,

          tabs: _tabScroll(), //list of tabs
        ),
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
      homeTab(title: "Toàn bộ", isSeprator: false),
      homeTab(title: "Chưa làm"),
      homeTab(title: "Hoàn thành"),
    ];
const List<String> _tabs = <String>['Tất cả', 'Đang học', 'Chờ'];
