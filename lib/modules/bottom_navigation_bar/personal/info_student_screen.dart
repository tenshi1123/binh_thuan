import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/login_model.dart';
import 'package:binh_thuan/modules/auth/forgor_password/change_password_screen.dart';
import 'package:binh_thuan/modules/auth/login/login_screen.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:binh_thuan/modules/exercise/exercise_model.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:binh_thuan/modules/notification/noti_repo.dart';
import 'package:binh_thuan/repo/repo/excercise_repo.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import 'package:binh_thuan/utils/onesignal.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:sp_util/sp_util.dart';
import 'package:binh_thuan/main.dart' as main;

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, this.useRouter = false, required this.info});
  final HomeModel info;
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
                    top: 60.h,
                    left: 30.w,
                    child: chatIcon(
                      context: context,
                      icon: 'assets/icons/message_icon.svg',
                    )),
                Positioned(
                  top: 60.h,
                  left: 320.w,
                  child: GestureDetector(
                    onTap: () async {
                      main.listNotification =
                          await NotificationRepo().getListMessages();
                      AppRouter.toPage(
                        context,
                        AppPages.NotificationScreen,
                        arguments: {},
                      );
                    },
                    child: SvgPicture.asset('assets/icons/noti_icon.svg'),
                  ),
                ),
                Positioned(
                  top: 100.h,
                  left: 0.w,
                  child: SizedBox(
                    width: 390.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  widget.info.student.gender == 'Nam'
                                      ? 'assets/images/avatar_nam.jpg'
                                      : 'assets/images/avatar_nu.jpg',
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
                              widget.info.student.fullName,
                              style: defaultText20.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'Mã học sinh: ${widget.info.student.code}',
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
                    height: 56.h,
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
                              widget.info.student.nameClass,
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
                        GestureDetector(
                          onTap: () async {
                            List<ExcerciseModel> listExercises =
                                await ExcerciseRepo().getListEcercise();
                            pushWithoutNavBar(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExerciseScreen(
                                  listExercises: listExercises,
                                ),
                              ),
                            );
                          },
                          child: Column(
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
                                '${widget.info.unfinished} bài tập',
                                style: defaultBoldText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
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
                      height: 250.h,
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
                                        widget.info.student.fullName,
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        widget.info.student.dob,
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                        widget.info.student.address,
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        widget.info.student.parentName,
                                        style: defaultBoldText.copyWith(
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        widget.info.student.phone,
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
            GestureDetector(
              onTap: () {
                pushWithoutNavBar(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePassScreen(),
                  ),
                );
                // AppRouter.toPage(
                //   context, AppPages.ChangePassScreen,
                //   // blocValue: _authBloc,
                // );
              },
              child: Column(
                children: [
                  const ManagementItem(
                    title: 'Đổi mật khẩu',
                    icon: 'assets/icons/lock.svg',
                  ),
                  Divider(
                    indent: 20.w,
                    endIndent: 20.w,
                  ),
                ],
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     AppRouter.toPage(
            //       context,
            //       AppPages.NotificationScreen,
            //       arguments: {},
            //     );
            //   },
            //   child: Column(
            //     children: [
            //       const ManagementItem(
            //         title: 'Thông báo',
            //         icon: 'assets/icons/bell_icon.svg',
            //       ),
            //       Divider(
            //         indent: 20.w,
            //         endIndent: 20.w,
            //       ),
            //     ],
            //   ),
            // ),

            // const ManagementItem(
            //   title: 'Chính sách và điều khoản',
            //   icon: 'assets/icons/privacy_icon.svg',
            // ),
            // Divider(
            //   thickness: 2,
            //   indent: 20.w,
            //   endIndent: 20.w,
            // ),
            GestureDetector(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Bạn có chắc chắn muốn đăng xuất không ?',
                        style: defaultText16,
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Hủy'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Đồng ý'),
                          onPressed: () {
                            deleteUserTag();
                            SpUtil.remove(ConstString.token);
                            Navigator.of(context, rootNavigator: true)
                                .pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const LoginScreen();
                                },
                              ),
                              (_) => false,
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  ManagementItem(
                    title: 'Đăng xuất',
                    icon: 'assets/icons/exit.svg',
                    style: defaultBoldText,
                  ),
                  Divider(
                    indent: 20.w,
                    endIndent: 20.w,
                  ),
                ],
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
