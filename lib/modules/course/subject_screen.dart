import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/course/course_screen.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tab_container/tab_container.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key, this.useRouter = false});
  final bool useRouter;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                flexibleSpace: SizedBox(
                  width: 390.w,
                  height: 156.h,
                  child: Stack(children: [
                    Positioned(
                      top: 0.h,
                      left: 0.h,
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        height: 156.h,
                        image: const AssetImage(
                          'assets/images/appbar_background2.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 71.h,
                      left: 70.w,
                      child: SvgPicture.asset('assets/icons/message_icon.svg'),
                    ),
                    Positioned(
                      top: 71.h,
                      left: 30.w,
                      child:
                          SvgPicture.asset('assets/icons/three_stick_icon.svg'),
                    ),
                    Positioned(
                      top: 71.h,
                      left: 300.w,
                      child: Container(
                          height: 32.h,
                          width: 65.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.r)),
                              color: Colors.transparent,
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '  04',
                                  style: defaultText12.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Nunito-Bold'),
                                ),
                                SvgPicture.asset('assets/icons/noti_icon.svg')
                              ])),
                    ),
                    Positioned(
                      bottom: 10.h,
                      left: 120.w,
                      child: Text(
                        'Toán nâng cao',
                        style: defaultText20.copyWith(
                          color: Colors.white,
                          fontFamily: 'Nunito-Bold',
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 5.h,
                        left: 5.w,
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ))
                  ]),
                ),
                automaticallyImplyLeading: false,
                pinned: false,
                toolbarHeight: 120.h,
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
          decoration: const BoxDecoration(color: Color(0xff6CC3C6)),
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
              unselectedTextStyle: defaultText12.copyWith(
                color: Colors.white,
              ),
              tabs: _getTabs1(),
              children: getChildren2(),
            ),
          ),
        ),
      ),
    );
  }
}

const List<String> _tabs = <String>['Lịch học', 'Bài tập', 'Thông tin'];
List<Widget> _getTabs1() {
  return _tabs
      .map((e) => Text(
            e,
          ))
      .toList();
}

List<Widget> getChildren2() {
  return _tabs.map((String name) {
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
  }).toList();
}

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return const CommingLesson();
        });
  }
}

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
