import 'dart:math';
import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1', 'Tab 2', 'tab3'];

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
                                fontFamily: 'Nunito-Bold'),
                          ),
                        ),
                        Positioned(
                          top: 150.h,
                          child: Text(
                            '\t    Sắp đến hạn',
                            style: defaultText16.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito-Bold'),
                          ),
                        ),
                        Positioned(
                          top: 170.h,
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
                                    entries: ['Tự luận', 'Về nhà'],
                                    color: Color(0xff85DDE0),
                                    title: 'Bài 3: Lorem ipsum dolor sit amet',
                                    time: 'Còn: 1 giờ',
                                  );
                                }),
                          ),
                        ),
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
                            ))
                      ],
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  snap: false,
                  stretch: true,
                  toolbarHeight: 270.h,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
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
                        SliverToBoxAdapter(
                          child: Text(
                            '   day la 1 cai title',
                            style: defaultBoldText,
                          ),
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
    return Container(
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
                        style: defaultText12.copyWith(color: color),
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
    );
  }
}

Widget homeTab({required String title, bool isSeprator = true}) {
  return Tab(
    child: Container(
      width: 130.w,
      height: 20,
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
          Text(title),
          Container(
            decoration: BoxDecoration(
              color: keyBlack,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            height: 20.h,
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            margin: EdgeInsets.only(left: 8.h),
            child: Center(
              child: Text(
                '21',
                style: defaultText12.copyWith(color: Colors.white),
              ),
            ),
          )
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
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 83.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 7), // changes position of shadow
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
            child: SvgPicture.asset('assets/icons/home_work_icon.svg',
                width: 18.w, height: 18.h, fit: BoxFit.fill),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                'Lorem ipsum',
                style: defaultBoldText,
              ),
              Text(
                'Hạn nộp: 20 tháng 4, 2024',
                style: defaultText14,
              )
            ],
          ),
        ],
      ),
    );
  }
}
