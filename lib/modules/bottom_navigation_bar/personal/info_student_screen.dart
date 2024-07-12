import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/auth/login/login_screen.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:binh_thuan/modules/chat/screen/list_conversation.dart';
import 'package:binh_thuan/modules/notification/local_notification.dart';
import 'package:binh_thuan/utils/onesignal.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:sp_util/sp_util.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, this.useRouter = false});

  final bool useRouter;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
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
              height: 600.h,
              child: Stack(children: [
                Positioned(
                  top: -30.h,
                  left: 0,
                  child: Image(
                    width: MediaQuery.of(context).size.width,
                    height: 520.h,
                    image: const AssetImage(
                      'assets/images/background_person.png',
                    ),
                    fit: BoxFit.fill,
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
                          builder: (context) => const ListConversation(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/message_icon.svg',
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
                    child: Builder(
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
                    },
                    child: Container(
                        height: 32.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 1)),
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
                ),
                Positioned(
                  top: 120.h,
                  left: 0.w,
                  child: SizedBox(
                    width: 390.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                scale: 2),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                ),
                Positioned(
                  top: 266.h,
                  left: 36.5.w,
                  child: SizedBox(
                    width: 316.w,
                    height: 47.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Lớp',
                              style: defaultText12.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              '10A1',
                              style: defaultBoldText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bài tập chưa làm',
                              style: defaultText12.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '4 bài tập',
                              style: defaultBoldText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: VerticalDivider(
                            color: Colors.white,
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
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '--/10 ',
                              style: defaultBoldText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 350.h,
                    left: 20.w,
                    child: Container(
                      height: 240.h,
                      width: 350.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Thông tin học sinh',
                            style: defaultBoldText,
                          ),
                          const Divider(),
                          SizedBox(
                            height: 180.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Họ và tên',
                                      style: defaultText14,
                                    ),
                                    Text(
                                      'Ngày sinh',
                                      style: defaultText14,
                                    ),
                                    Text(
                                      'Địa chỉ \n',
                                      style: defaultText14,
                                    ),
                                    Text(
                                      'Phụ huynh',
                                      style: defaultText14,
                                    ),
                                    Text(
                                      'Liên lạc',
                                      style: defaultText14,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 216.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Nguyễn Hồng Ánh',
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        'dd/mm/yyyy',
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                        'Bắc Xuân An, Phường Xuân An, Tp. Phan thiết, Tỉnh Bình Thuận.',
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        'Nguyễn Hồng Quang',
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        '0937558769',
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 0, 10.h),
              child: Text(
                'Quản lý tài khoản',
                style: defaultBoldText,
              ),
            ),
            const ManagementItem(
              title: 'Đổi mật khẩu',
              icon: 'assets/icons/bell_icon.svg',
            ),
            Divider(
              indent: 20.w,
              endIndent: 20.w,
            ),
            const ManagementItem(
              title: 'Thông báo',
              icon: 'assets/icons/bell_icon.svg',
            ),
            Divider(
              indent: 20.w,
              endIndent: 20.w,
            ),
            const ManagementItem(
              title: 'Chính sách và điều khoản',
              icon: 'assets/icons/privacy_icon.svg',
            ),
            Divider(
              thickness: 2,
              indent: 20.w,
              endIndent: 20.w,
            ),
            GestureDetector(
              onTap: () {
                deleteUserTag();
                SpUtil.remove(ConstString.token);
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginScreen();
                    },
                  ),
                  (_) => false,
                );
              },
              child: ManagementItem(
                title: 'Đăng xuất',
                icon: 'assets/icons/privacy_icon.svg',
                style: defaultBoldText,
              ),
            ),
            SizedBox(
              height: 80.h,
            )
          ],
        ),
      ),
    );
  }
}

class ManagementItem extends StatelessWidget {
  final String title;
  final String icon;
  final TextStyle? style;
  const ManagementItem(
      {super.key, required this.title, required this.icon, this.style});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.w,
      height: 30.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SizedBox(
              width: 20.w,
            ),
            SvgPicture.asset(icon),
            SizedBox(width: 10.w),
            Text(
              title,
              style: style ?? defaultText16,
            ),
          ]),
          SvgPicture.asset('assets/icons/arrow_right_icon.svg'),
        ],
      ),
    );
  }
}
