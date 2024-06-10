import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.useRouter = false});

  final bool useRouter;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(3, (index) => NotificationItem(title: index));
    return Scaffold(
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
                    width: 390.w,
                    height: 260.h,
                    image:
                        const AssetImage('assets/images/home_background.png'),
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
                  child: SvgPicture.asset('assets/icons/three_stick_icon.svg'),
                ),
                Positioned(
                  top: 71.h,
                  left: 300.w,
                  child: InkWell(
                    onTap: () {
                      AppRouter.toPage(
                        context, AppPages.NotificationScreen,
                        // blocValue: _authBloc,
                      );
                    },
                    child: Container(
                        height: 32.h,
                        width: 65.w,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: kPrimaryColor,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '  04',
                                style: TextStyle(color: Colors.white),
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
                        width: 80.w,
                        height: 80.h,
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
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Mã học sinh: 10A1-32SD',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
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
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Nunito',
                                color: Colors.black,
                              ),
                            ),
                            //const Divider(),
                            Text(
                              '10A1',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
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
                              'Đang tham gia',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                                fontFamily: 'Nunito',
                              ),
                            ),
                            Text(
                              '3 khóa học',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontFamily: 'Nunito',
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
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                                fontFamily: 'Nunito',
                              ),
                            ),
                            Text(
                              '--/10 ',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontFamily: 'Nunito',
                              ),
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('AlertDialog Title'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('This is a demo alert dialog.'),
                                Text(
                                    'Would you like to approve of this message?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Approve'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/calender.svg',
                    height: 86.h,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/home_work.svg',
                  height: 86.h,
                ),
                SvgPicture.asset(
                  'assets/icons/score.svg',
                  height: 86.h,
                ),
                SvgPicture.asset(
                  'assets/icons/tuition.svg',
                  height: 86.h,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 0, 10.h),
              child: Text(
                'Đang diễn ra',
                style: TextStyle(
                  fontSize: 16.sp,
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
                    color: Colors.grey.withOpacity(0.4),
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
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontFamily: 'Nunito',
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
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      Row(
                        children: [
                          Row(children: [
                            SvgPicture.asset('assets/icons/online.svg'),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text('07:15 - 08:15'),
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
                      style: TextStyle(
                        fontSize: 16.sp,
                        //height: 15.h,
                        fontFamily: 'Nunito',
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
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            // SizedBox(
            //   height: 138.h,
            //   child: Swiper(
            //     itemBuilder: (BuildContext context, int index) {
            //       return NotificationItem(
            //         title: index,
            //       );
            //     },
            //     itemCount: 3,
            //     itemWidth: 300.w,
            //     indicatorLayout: PageIndicatorLayout.COLOR,
            //     autoplay: true,
            //     pagination: const SwiperPagination(),
            //     //control: const SwiperControl(),
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
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
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                Text(
                  'Xem thêm    ',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
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
                return const CalenderItem();
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

class ExampleDialog extends StatelessWidget {
  const ExampleDialog({super.key});

  @override
  Widget build(BuildContext context) => Dialog(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "This is a modal screen",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Return"),
                ),
              ),
            ],
          ),
        ),
      );
}

class CalenderItem extends StatelessWidget {
  const CalenderItem({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        width: 350.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 7), // changes position of shadow
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
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Nunito',
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
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'tháng 4',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Nunito',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Toán',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontFamily: 'Nunito',
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/time_icon.svg'),
                    const Text('  Thời gian: 07:15 - 08:00'),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/teacher_icon.svg'),
                    const Text('  Giáo viên: HươngNN'),
                  ],
                ),
              ],
            )
          ],
        ),
      );
}

class NotificationItem extends StatelessWidget {
  final int title;

  const NotificationItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
      width: 390.w,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        color: const Color(0xffDADEF1),
      ),
      child: Row(
        children: [
          Container(
            height: 76.h,
            width: 76.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              color: const Color(0xff6B7AC7),
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/calender_icon.svg'),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title [Quan trọng] Thay đổi lịch học',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontFamily: 'Nunito',
                  ),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipis cing elit, sed do eiusmod tempor...',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
