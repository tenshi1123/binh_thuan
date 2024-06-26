import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/auth/login/login_screen.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:binh_thuan/modules/chat/screen/list_conversation.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:binh_thuan/modules/notification/local_notification.dart';
import 'package:binh_thuan/modules/schedule/table_calender.dart';
import 'package:binh_thuan/modules/tuition/tuition_screen.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.useRouter = false});

  final bool useRouter;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  // final int _selectedIndex = 0;
  @override
  void initState() {
    listenToNotifications();
    super.initState();
  }

  //  to listen to any notification clicked or not
  listenToNotifications() {
    if (kDebugMode) {
      print("Listening to notification");
    }
    LocalNotifications.onClickNotification.stream.listen((event) {
      if (kDebugMode) {
        print('${event}tesst');
      }
      Navigator.pushNamed(context, '/another', arguments: event);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(3, (index) => NotificationItem(title: index));
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 54.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/placeholder_avatar.png',
                        ),
                        scale: 2),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Nguyễn Hồng Ánh',
                      style: defaultText20.copyWith(
                          fontWeight: FontWeight.w800, color: keyBlack),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'Mã học sinh: 10A1-32SD',
                      style: defaultText12.copyWith(color: color666),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ],
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            const MenuItem(title: 'Bài tập'),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 40.h,
              child: Text(
                '\r  Khóa học bổ trợ',
                style: defaultText16,
              ),
            ),
            const CourseItem(
              title: 'Toán',
            ),
            SizedBox(
              height: 10.h,
            ),
            const CourseItem(
              title: 'Văn ',
            ),
            SizedBox(
              height: 10.h,
            ),
            const CourseItem(
              title: 'Anh',
            ),
            // ListTile(
            //   title: const Text('School'),
            //   selected: _selectedIndex == 2,
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            SizedBox(
              height: 10.h,
            ),
            const MenuItem(title: 'Bảng điểm'),
            SizedBox(
              height: 10.h,
            ),
            const MenuItem(title: 'Tài liệu'),
            SizedBox(
              height: 50.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginScreen();
                    },
                  ),
                  (_) => false,
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 80.w),
                height: 40.h,
                decoration: BoxDecoration(
                  color: color9B9,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Đăng xuất',
                    style: defaultText20.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 390.w,
              height: 350.h,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image(
                    width: MediaQuery.of(context).size.width,
                    height: 260.h,
                    image: const AssetImage(
                      'assets/images/home_background.png',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 71.h,
                  left: 70.w,
                  child: InkWell(
                    onTap: () {
                      pushWithoutNavBar(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListConversation()));
                    },
                    child: SvgPicture.asset(
                      'assets/icons/message_icon.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 71.h,
                  left: 30.w,
                  child: GestureDetector(
                    onTap: () {
                      LocalNotifications.showPeriodicNotifications(
                          title: 'pro', body: 'hihi', payload: 'a');
                    },
                    child:
                        //  InkWell(
                        //     onTap: () {
                        //       Scaffold.of(context).openDrawer();
                        //     },
                        //     child: SvgPicture.asset(
                        //         'assets/icons/three_stick_icon.svg')),
                        Builder(
                      builder: (context) {
                        return InkWell(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: SvgPicture.asset(
                                'assets/icons/three_stick_icon.svg'));
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 71.h,
                  left: 300.w,
                  child: InkWell(
                    onTap: () {
                      LocalNotifications.showSimpleNotification(
                          title: 'test',
                          body: 'this is body',
                          payload: 'this is payload');
                      //LocalNotification.cancelAll();
                    },
                    child:
                        // Container(
                        //   height: 32.h,
                        //   width: 65.w,
                        //   decoration: const BoxDecoration(
                        //     borderRadius: BorderRadius.all(Radius.circular(15)),
                        //     color: kPrimaryColor,
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         '  04',
                        //         style: defaultText12.copyWith(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.w700),
                        //       ),
                        //       SvgPicture.asset('assets/icons/noti_icon.svg')
                        //     ],
                        //   ),
                        // ),
                        Container(
                            height: 32.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.r)),
                                color: Colors.transparent,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                ),
                Positioned(
                  top: 112.h,
                  left: 20.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 72.w,
                        height: 72.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/placeholder_avatar.png',
                              ),
                              scale: 3),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyễn Hồng Ánh',
                            style: defaultText20.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Mã học sinh: 10A1-32SD',
                            style: defaultText12.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 40.h,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 226.h,
                  left: 20.w,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    width: 350.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      //color: Colors.pinkAccent,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(4, 7), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'love',
                              style: defaultText12.copyWith(
                                  fontWeight: FontWeight.w700, color: color666),
                            ),
                            //const Divider(),
                            Text(
                              '10A1',
                              style: defaultText20.copyWith(
                                  fontWeight: FontWeight.w900, color: keyBlack),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Đang tham gia',
                              style: defaultText12.copyWith(
                                fontWeight: FontWeight.w700,
                                color: color666,
                              ),
                            ),
                            Text(
                              '3 khóa học',
                              style: defaultText16.copyWith(
                                fontWeight: FontWeight.w800,
                                color: keyBlack,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Điểm trung bình',
                              style: defaultText12.copyWith(
                                fontWeight: FontWeight.w700,
                                color: color666,
                              ),
                            ),
                            Text(
                              '--/10 ',
                              style: defaultText16.copyWith(
                                  fontWeight: FontWeight.w800, color: keyBlack),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    pushWithoutNavBar(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const TableEventsExample()),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/calender.svg',
                    height: 86.h,
                  ),
                ),
                InkWell(
                  onTap: () {
                    pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExerciseScreen()));
                  },
                  child: SvgPicture.asset(
                    'assets/icons/home_work.svg',
                    height: 86.h,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/score.svg',
                  height: 86.h,
                ),
                InkWell(
                  onTap: () {
                    pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TuitionScreen()));
                  },
                  child: SvgPicture.asset(
                    'assets/icons/tuition.svg',
                    height: 86.h,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 10.h),
              child: Text(
                'Đang diễn ra',
                style: defaultText16.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              width: 390.w,
              height: 100.h,
              decoration: BoxDecoration(
                //color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(4, 8), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum',
                        style: defaultText18.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(
                            start: 1.0, end: 1.0),
                        height: 1.h,
                        width: 42.w,
                        color: Colors.black,
                      ),
                      Text(
                        'Tiết 8: Lorem ipsum dolor sit amet',
                        style: defaultText14,
                      ),
                      Row(
                        children: [
                          Row(children: [
                            SvgPicture.asset('assets/icons/online.svg'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '07:15 - 08:15',
                              style: defaultText14.copyWith(
                                  color: const Color(0xff666666)),
                            ),
                          ]),
                        ],
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(6),
                    height: 76.h,
                    width: 76.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                      color: const Color(0xffFF6667),
                    ),
                    child: Text(
                      'Vào \nhọc',
                      style: defaultText16.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 15.w, 0, 0),
              child: Text(
                'Thông báo',
                style: defaultText16.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 138.h,
                  width: 390.w,
                  child: PageView.builder(
                    padEnds: false,
                    controller: controller,
                    itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const SlideEffect(
                      paintStyle: PaintingStyle.stroke,
                      activeDotColor: kPrimaryColor,
                      dotColor: kPrimaryColor,
                      dotHeight: 13,
                      dotWidth: 13),
                  onDotClicked: (index) {
                    controller.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '    Lịch học sắp tới',
                  style: defaultText16.copyWith(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                Text(
                  'Xem thêm    ',
                  style: defaultText12.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.blue),
                ),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return const ComingLesson();
              },
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
