import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

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
                  style: defaultText20.copyWith(
                      color: keyWhite, fontWeight: FontWeight.w800),
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
            const NotiItem(
              icon: 'assets/icons/wallet.svg',
              title: 'Yêu cầu: Hoàn thành học phí kì II/2024 ',
              title2: 'Giáo viên HươngNN đã thêm một tài...',
              time: '18:06',
            ),
            SizedBox(
              height: 16.h,
            ),
            const NotiItem(
              icon: 'assets/icons/wallet.svg',
              title: 'Yêu cầu: Hoàn thành học phí kì II/2024 ',
              title2: 'Giáo viên HươngNN đã thêm một tài...',
              time: '18:06',
            ),
            SizedBox(
              height: 16.h,
            ),
            const NotiItem(
              icon: 'assets/icons/wallet.svg',
              title: 'Yêu cầu: Hoàn thành học phí kì II/2024 ',
              title2: 'Giáo viên HươngNN đã thêm một tài...',
              time: '18:06',
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
  final String icon;
  final String title;
  final String title2;
  final String time;
  const NotiItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.title2,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      height: 78.h,
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          SvgPicture.asset(icon),
          SizedBox(
            width: 12.w,
          ),
          SizedBox(
            width: 250,
            child: Column(
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                  style: defaultText20.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  title2,
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
            time,
            style: defaultText12,
          ),
        ],
      ),
    );
  }
}
