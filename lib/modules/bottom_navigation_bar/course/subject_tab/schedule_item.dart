import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/models/lesson_model.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:binh_thuan/modules/lesson_details/screen/lesson_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> _tabScroll(int count) => [
      homeTab(title: "Video", isSeprator: false, count: count),
      homeTab(title: "PDF", count: count),
      const SizedBox()
    ];
const List<String> _tabs = <String>['Sắp tới', 'Đã hoàn thành'];

class InfoItem extends StatefulWidget {
  const InfoItem({super.key, required this.videoLesson, required this.taiLieu});
  final List<LessonModels> videoLesson;
  final List<DocumentModel> taiLieu;

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TabBar(
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
        // controller: TabController(
        //   length: 2,
        //   vsync: this,
        // ),
        tabs: _tabScroll(widget.taiLieu.length), //list of tabs
      ),
      body: TabBarView(children: [
        SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                key: const PageStorageKey<String>('video'),
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
                          if (widget.videoLesson.isNotEmpty) {
                            return DocumentItem(
                              videoLesson: widget.videoLesson[index],
                              isVideo: true,
                              videoContent: '',
                            );
                          }
                          return const SizedBox();
                        },
                        childCount: widget.videoLesson.length,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                key: const PageStorageKey<String>('pdf'),
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
                          if (widget.taiLieu.isNotEmpty) {
                            return DocumentItem(
                              taiLieu: widget.taiLieu[index],
                              videoContent: '',
                            );
                          }
                          return const SizedBox();
                        },
                        childCount: widget.taiLieu.length,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}

class TaiLieuTabBar extends StatefulWidget {
  const TaiLieuTabBar(
      {super.key,
      required this.videoLesson,
      required this.taiLieu,
      required this.listChapter});

  final List<LessonModels> videoLesson;
  final List<DocumentModel> taiLieu;
  final List<SubjectChapterModels> listChapter;
  @override
  State<TaiLieuTabBar> createState() => _TaiLieuTabBarState();
}

class _TaiLieuTabBarState extends State<TaiLieuTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar.secondary(
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
          controller: _tabController,
          tabs: <Widget>[
            homeTab(
              title: 'video',
              isSeprator: false,
              count: widget.videoLesson.length,
            ),
            homeTab(
              title: 'pdf',
              count: widget.taiLieu.length,
            ),
            homeTab(
              title: 'Phân Chương',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: const PageStorageKey<String>('video'),
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
                              if (widget.videoLesson.isNotEmpty) {
                                return DocumentItem(
                                  videoLesson: widget.videoLesson[index],
                                  isVideo: true,
                                  videoContent: '',
                                );
                              }
                              return const SizedBox();
                            },
                            childCount: widget.videoLesson.length,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: const PageStorageKey<String>('pdf'),
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
                              if (widget.taiLieu.isNotEmpty) {
                                return DocumentItem(
                                  taiLieu: widget.taiLieu[index],
                                  videoContent: '',
                                );
                              }
                              return const SizedBox();
                            },
                            childCount: widget.taiLieu.length,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: const PageStorageKey<String>('pdf'),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        sliver: SliverFixedExtentList(
                          itemExtent: 150.h,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Text(
                                    widget.listChapter[index].name,
                                    style: defaultText16,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      //itemExtent: 390.0.w,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      itemCount: widget
                                          .listChapter[index].lesson.length,
                                      itemBuilder:
                                          (BuildContext context, int index2) {
                                        return Text(
                                          widget.listChapter[index]
                                              .lesson[index2].name,
                                          style: defaultText16,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                              // if (widget.taiLieu.isNotEmpty) {
                              //   return DocumentItem(
                              //     taiLieu: widget
                              //         .listChapter[0].lesson[0].document[0],
                              //     videoContent: '',
                              //   );
                              // }
                              // return const SizedBox();
                            },
                            childCount: widget.listChapter.length,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class LichhocTabBar extends StatefulWidget {
  const LichhocTabBar(
      {required this.lichHocSaptoi,
      required this.daHoanThanh,
      required this.document,
      super.key});

  final List<LichHocModels> lichHocSaptoi;
  final List<LichHocModels> daHoanThanh;
  final List<DocumentModel> document;
  @override
  State<LichhocTabBar> createState() => _LichhocTabBarState();
}

class _LichhocTabBarState extends State<LichhocTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar.secondary(
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
              horizontal: 20.w,
            ), //give some padding to reduce the size of indicator
          ),
          unselectedLabelColor: keyBlack.withOpacity(0.3),
          labelColor: keyBlack,
          controller: _tabController,
          tabs: <Widget>[
            homeTab(title: 'Sắp tới', isSeprator: false),
            homeTab(title: 'Đã hoàn thành'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
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
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 120.h,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return (name == 'Sắp tới')
                                    ? CompleteLesson(
                                        lichHoc: widget.lichHocSaptoi[index],
                                        document: widget.document,
                                      )
                                    : CompleteLesson(
                                        lichHoc: widget.daHoanThanh[index],
                                        document: widget.document,
                                      );
                              },
                              childCount: (name == 'Sắp tới')
                                  ? widget.lichHocSaptoi.length
                                  : widget.daHoanThanh.length,
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
      ],
    );
  }
}
