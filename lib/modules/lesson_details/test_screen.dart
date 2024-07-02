import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                RichText(
                  text: TextSpan(
                      text: '<  Chi tiết buổi học ',
                      style: defaultBoldText.copyWith(
                        fontSize: 14.sp,
                        color: keyBlack.withOpacity(0.5),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pop(),
                      children: [
                        TextSpan(
                          text: ' <  Kiểm tra',
                          style: defaultBoldText.copyWith(fontSize: 14.sp),
                        )
                      ]),
                ),
                SizedBox(
                  width: 120.w,
                ),
                SvgPicture.asset('assets/icons/three_dots_icon.svg'),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            _infoTest(isComplete: true),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Trả kết quả',
              style: defaultBoldText.copyWith(fontSize: 20.sp),
            ),
            _resultTest(),
          ],
        ),
      ),
    );
  }
}

Widget _infoTest({required bool isComplete}) {
  return Container(
    width: 350.w,
    height: 300.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(8.r),
      ),
      boxShadow: [
        BoxShadow(
          color: kPrimaryColor.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(4, 5), // changes position of shadow
        ),
      ],
    ),
    child: Stack(
      children: [
        Positioned(
          right: 12.w,
          top: 12.h,
          child: Container(
            height: 63.h,
            width: 63.w,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(4, 5),
                  )
                ]),
            child: Center(
              child: Text(
                '8.5',
                style: defaultBoldText.copyWith(
                  color: rec27Teal,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          left: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 90.w,
                    height: 23.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'Trắc nghiệm',
                        style: defaultBoldText.copyWith(
                          color: Colors.white,
                          fontSize: 12.w,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Container(
                    width: 81.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '15 phút',
                        style: defaultBoldText.copyWith(
                          color: Colors.white,
                          fontSize: 12.w,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 253.w,
                child: Text(
                  'Tiết 8: Lorem ipsum dolor sit amet  ',
                  style: defaultBoldText.copyWith(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Text(
                'Thời lượng: 15 phút',
                style: defaultText14,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6.h),
                height: 1.h,
                width: 300.w,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              Text(
                'Mô tả',
                style: defaultBoldText.copyWith(fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                width: 320.w,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                  style: defaultText14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              isComplete
                  ? Container(
                      width: 326.w,
                      height: 51.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffDEE4ED),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Center(
                          child: Text(
                        'Đã hoàn thành',
                        style: defaultBoldText.copyWith(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      )),
                    )
                  : Container(
                      width: 326.w,
                      height: 51.h,
                      decoration: BoxDecoration(
                        color: rec27Teal,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Center(
                          child: Text(
                        'Làm bài',
                        style: defaultBoldText.copyWith(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      )),
                    ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _resultTest() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircularPercentIndicator(
          radius: 80.r,
          lineWidth: 13.0,
          animation: true,
          percent: 35 / 40,
          center: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                "35      ",
                style: defaultBoldText.copyWith(fontSize: 30.sp),
              ),
              Divider(
                thickness: 2,
                color: keyBlack,
                indent: 30.w,
                endIndent: 30.w,
              ),
              Text(
                "      40",
                style: defaultBoldText.copyWith(fontSize: 20.sp),
              ),
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: kPrimaryColor,
          backgroundColor: kPrimaryColor.withOpacity(0.3)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _resultText(tittle1: 'Thời gian hoàn thành', title2: '00:13:41'),
          _resultText(tittle1: 'Trả lời đúng', title2: '35 câu'),
          _resultText(tittle1: 'Trả lời sai', title2: '5 câu'),
          _resultText(tittle1: 'Chưa làm', title2: '0 câu'),
        ],
      )
    ],
  );
}

Widget _resultText({required String tittle1, required String title2}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle1,
        style: defaultText14,
      ),
      Text(
        title2,
        style: defaultBoldText,
      ),
      SizedBox(
        height: 8.h,
      )
    ],
  );
}
