import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/main.dart';
import 'package:binh_thuan/modules/notification/noti_model.dart';
import 'package:binh_thuan/modules/tuition/tuition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 125.h,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: keyWhite),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: SizedBox(
          height: 125.h,
          child: Stack(
            children: [
              Image(
                height: 125.h,
                width: MediaQuery.of(context).size.width,
                image: const AssetImage('assets/images/appbar_background.png'),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 230.w,
                bottom: 22.h,
                child: Text(
                  'Thông báo',
                  style: defaultBoldText.copyWith(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 20.w),
                Text(
                  'Hôm nay',
                  style: defaultText16.copyWith(
                    color: keyBlack,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 200.w,
                ),
                Text(
                  '15.04.2024',
                  style: defaultText16.copyWith(
                    color: color666,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: listNotification.length,
              itemBuilder: (BuildContext context, int index) {
                return NotiItem(notification: listNotification[index]);
              },
            ),
            Divider(
              indent: 20.w,
              endIndent: 20.w,
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 8.h),
              child: Text(
                '14.04.2024',
                style: defaultText16.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotiItem extends StatelessWidget {
  final NotiModel notification;
  const NotiItem({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushWithoutNavBar(context,
            MaterialPageRoute(builder: (context) => const TuitionScreen()));
      },
      child: SizedBox(
        width: 390.w,
        height: 78.h,
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            SvgPicture.asset('assets/icons/wallet.svg'),
            SizedBox(
              width: 12.w,
            ),
            SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.headings,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: defaultBoldText,
                  ),
                  Text(
                    notification.contents,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: defaultText12,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              (notification.completedAt.day == DateTime.now().day)
                  ? DateFormat("hh:mm").format(notification.completedAt)
                  : DateFormat("dd-MM").format(notification.completedAt),
              style: defaultText12,
            ),
          ],
        ),
      ),
    );
  }
}
