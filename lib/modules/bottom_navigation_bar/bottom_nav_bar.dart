import "package:binh_thuan/constants/colors.dart";
import "package:binh_thuan/models/login_model.dart";
import "package:binh_thuan/models/subject_models.dart";
import "package:binh_thuan/modules/bottom_navigation_bar/home/home_screen.dart";
import "package:binh_thuan/modules/bottom_navigation_bar/course/list_subject_screen.dart";
import "package:binh_thuan/utils/onesignal.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:onesignal_flutter/onesignal_flutter.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "personal/info_student_screen.dart";
import 'dart:io' show Platform;

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {super.key, required this.info, required this.listSubjectModel});
  final HomeModel info;
  final List<SubjectModels> listSubjectModel;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController();
  Future<void> setupOneSignal(int userId) async {
    await initOneSignal();
    if (Platform.isAndroid) {
      OneSignal.Notifications.addClickListener((event) {
        print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      });
    } else {
      //do nothing :v
    }

    promptPolicyPrivacy(userId);
  }

  Future<void> promptPolicyPrivacy(int userId) async {
    if (Platform.isAndroid) {
      OneSignal.consentRequired(true);
      OneSignal.consentGiven(true);
    } else {
      //do nothing :v
    }

    sendUserTag(userId);
  }

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: HomeScreen(
            info: widget.info,
          ),
          item: ItemConfig(
            icon: const ImageIcon(
              AssetImage('assets/images/nav_bar_1.png'),
            ),
            title: "Trang chủ",
            activeForegroundColor: kPrimaryColor,
            inactiveForegroundColor: Colors.white,
            activeColorSecondary: Colors.white,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: NestedScroll(
            info: widget.info,
            listSubjectModel: widget.listSubjectModel,
          ),
          item: ItemConfig(
            icon: const ImageIcon(
              AssetImage('assets/images/nav_bar_2.png'),
            ),
            title: "Môn học",
            activeForegroundColor: kPrimaryColor,
            inactiveForegroundColor: Colors.white,
            activeColorSecondary: Colors.white,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: InfoScreen(
            info: widget.info,
          ),
          item: ItemConfig(
            icon: const ImageIcon(
              AssetImage('assets/images/nav_bar_3.png'),
            ),
            title: "Hồ sơ",
            activeForegroundColor: kPrimaryColor,
            inactiveForegroundColor: Colors.white,
            activeColorSecondary: Colors.white,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
        itemPadding: EdgeInsets.all(5.h),
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: const Color(0xff4659B9),
          borderRadius: BorderRadius.circular(38.r),
        ),
        //itemAnimationProperties: const ItemAnimation(),
      ),
      backgroundColor: Colors.white,
      navBarHeight: 50.h,
      // onWillPop: (context) async {
      //   await showDialog(
      //     context: context,
      //     builder: (context) => Dialog(
      //       child: Center(
      //         child: ElevatedButton(
      //           child: const Text("Close"),
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //         ),
      //       ),
      //     ),
      //   );
      //   return false;
      // },
    );
  }
}
