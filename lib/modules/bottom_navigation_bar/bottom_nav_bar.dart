import "package:binh_thuan/constants/colors.dart";
import "package:binh_thuan/modules/bottom_navigation_bar/home/home_screen.dart";
import "package:binh_thuan/modules/course/course_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController();

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
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
          screen: const NestedScroll(),
          item: ItemConfig(
            icon: const ImageIcon(
              AssetImage('assets/images/nav_bar_2.png'),
            ),
            title: "Khóa học",
            activeForegroundColor: kPrimaryColor,
            inactiveForegroundColor: Colors.white,
            activeColorSecondary: Colors.white,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: const HomeScreen(),
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
  Widget build(BuildContext context) => PersistentTabView(
        controller: _controller,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style2BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: const Color(0xff4659B9),
            borderRadius: BorderRadius.circular(38.r),
          ),
          //itemAnimationProperties: const ItemAnimation(),
        ),
        backgroundColor: Colors.white,
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
