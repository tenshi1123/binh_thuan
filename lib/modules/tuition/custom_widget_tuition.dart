import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotyetItem extends StatelessWidget {
  const NotyetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: 390.w,
      child: Stack(
        children: [
          Positioned(
            left: 10.w,
            top: 180.h,
            child: Container(
              width: 351.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: const Color(0xffFF9899),
                  borderRadius: BorderRadius.all(Radius.circular(18.r))),
            ),
          ),
          Positioned(
            left: 10.w,
            child: Image(
              height: 246.h,
              width: 351.w,
              image: const AssetImage('assets/images/Subtract1.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 248.h,
            left: 25.w,
            child: Text(
              'Hạn nộp đến hết 15:00 ngày 25.04.2024  ',
              style: defaultText16.copyWith(
                color: keyWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 18.w,
            child: Text('Học kỳ II/2024',
                style: defaultText20.copyWith(
                    color: const Color(0xffFF6667),
                    fontWeight: FontWeight.w700)),
          ),
          Positioned(
            left: 20.w,
            top: 38.h,
            child: SizedBox(
              width: 320.w,
              height: 200.h,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RowFeeCustom(
                    title: 'Thời hạn',
                    content: '13.04.2024 - 25.04.2925',
                  ),
                  Divider(),
                  RowFeeCustom(
                    title: 'Tiền học',
                    content: '1.200.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Phí bán trú',
                    content: '500.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Khóa học bổ trợ',
                    content: '500.000 VND',
                  ),
                  Divider(),
                  RowFeeCustom(
                    title: 'Tổng',
                    content: '2.200.000 VND',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 276.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.r)),
                color: const Color(0xffFF9899),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Chưa nộp',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotEnoughItem extends StatelessWidget {
  const NotEnoughItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      width: 390.w,
      child: Stack(
        children: [
          Positioned(
            left: 10.w,
            top: 220.h,
            child: Container(
              width: 351.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: const Color(0xffEBC27A),
                  borderRadius: BorderRadius.all(Radius.circular(18.r))),
            ),
          ),
          Positioned(
            left: 10.w,
            child: Image(
              height: 287.h,
              width: 351.w,
              image: const AssetImage('assets/images/Subtract2.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 287.h,
            left: 25.w,
            child: Text(
              'Hạn nộp đến hết 15:00 ngày 25.04.2024  ',
              style: defaultText16.copyWith(
                color: keyWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 248.h,
            left: 18.w,
            child: Text(
              'Hạn nộp đến hết 15:00 ngày 25.04.2024  ',
              style: defaultText16.copyWith(
                color: keyWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 18.w,
            child: Text('Học kỳ II/2024',
                style: defaultText20.copyWith(
                    color: const Color(0xffEBC27A),
                    fontWeight: FontWeight.w700)),
          ),
          Positioned(
            left: 20.w,
            top: 50.h,
            child: SizedBox(
              width: 320.w,
              height: 230.h,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RowFeeCustom(
                    title: 'Thời hạn',
                    content: '13.04.2024 - 25.04.2925',
                  ),
                  Divider(),
                  RowFeeCustom(
                    title: 'Tiền học',
                    content: '1.200.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Phí bán trú',
                    content: '500.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Khóa học bổ trợ',
                    content: '500.000 VND',
                  ),
                  Divider(),
                  RowFeeCustom(
                    title: 'Tổng',
                    content: '2.200.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Đã đóng',
                    content: '-1.000.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Còn thiếu',
                    content: '1.200.000 VND',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 298.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.r)),
                color: const Color(0xffEBC27A),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3.h),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Thiếu',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompleteItem extends StatelessWidget {
  const CompleteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      width: 390.w,
      child: Stack(
        children: [
          Positioned(
            left: 10.w,
            top: 220.h,
            child: Container(
              width: 351.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: const Color(0xff91D2D4),
                  borderRadius: BorderRadius.all(Radius.circular(18.r))),
            ),
          ),
          Positioned(
            left: 10.w,
            child: Image(
              height: 287.h,
              width: 352.w,
              image: const AssetImage('assets/images/Subtract3.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 287.h,
            left: 25.w,
            child: Text(
              'Đã hoàn thành khoản nộp ngày 25.04.2025 ',
              style: defaultText16.copyWith(
                color: keyWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 248.h,
            left: 18.w,
            child: Text(
              'Hạn nộp đến hết 15:00 ngày 25.04.2024  ',
              style: defaultText16.copyWith(
                color: keyWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 18.w,
            child: Text('Học kỳ II/2024',
                style: defaultText20.copyWith(
                    color: const Color(0xff91D2D4),
                    fontWeight: FontWeight.w700)),
          ),
          Positioned(
            left: 20.w,
            top: 50.h,
            child: SizedBox(
              width: 320.w,
              height: 230.h,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RowFeeCustom(
                    title: 'Thời hạn',
                    content: '13.04.2024 - 25.04.2925',
                  ),
                  Divider(),
                  RowFeeCustom(
                    title: 'Tiền học',
                    content: '1.200.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Phí bán trú',
                    content: '500.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Khóa học bổ trợ',
                    content: '500.000 VND',
                  ),
                  Divider(),
                  RowFeeCustom(
                    title: 'Tổng',
                    content: '2.200.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Đã đóng',
                    content: '-1.000.000 VND',
                  ),
                  RowFeeCustom(
                    title: 'Còn thiếu',
                    content: '1.200.000 VND',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 260.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.r)),
                color: const Color(0xff91D2D4),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3.h),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Hoàn thành',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowFeeCustom extends StatelessWidget {
  final String title;
  final String content;

  const RowFeeCustom({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: defaultText16.copyWith(
            color: colorDarkBlue,
          ),
        ),
        Text(
          content,
          style: defaultText16.copyWith(
            color: colorDarkBlue,
          ),
        ),
      ],
    );
  }
}
