import "package:binh_thuan/modules/bottom_navigation_bar/home/home_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class InteractiveExample extends StatefulWidget {
  const InteractiveExample({super.key});

  @override
  State<InteractiveExample> createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {
  final PersistentTabController _controller = PersistentTabController();

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Trang chủ",
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.school),
            title: "Khóa học",
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: "Hồ sơ",
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        controller: _controller,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style8BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: const Color(0xff4659B9),
            borderRadius: BorderRadius.circular(38.r),
          ),
          itemAnimationProperties: const ItemAnimation(),
        ),
        backgroundColor: Colors.white,
        onWillPop: (context) async {
          await showDialog(
            context: context,
            builder: (context) => Dialog(
              child: Center(
                child: ElevatedButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
          return false;
        },
      );
}
