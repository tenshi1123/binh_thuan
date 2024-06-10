import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          //title: const Text("Sample"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(),
          child: SafeArea(
            child: Stack(children: <Widget>[
              Positioned(
                  top: 476.h,
                  left: 46.w,
                  child: Container(
                      width: 299.w,
                      height: 49.h,
                      decoration: BoxDecoration(
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
                            offset: const Offset(
                                4, 7), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ))),
              Positioned(
                  top: 408.h,
                  left: 60.w,
                  child: Text(
                    'Nhập mã học sinh đã được cấp hoặc số điện thoại',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: const Color.fromRGBO(153, 153, 153, 1),
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        //letterSpacing: -0.5,
                        fontWeight: FontWeight.normal,
                        height: 1.1666666666666667.h),
                  )),
              Positioned(
                  top: 386.h,
                  left: 150.h,
                  child: Text(
                    'Quên mật khẩu ?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: const Color.fromRGBO(153, 153, 153, 1),
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        //letterSpacing: -0.5,
                        fontWeight: FontWeight.bold,
                        height: 1.1666666666666667.h),
                  )),
              Positioned(
                top: 560.h,
                left: 46.w,
                child: InkWell(
                  onTap: () {
                    AppRouter.toPage(context, AppPages.OtpScreen,
                        // blocValue: _authBloc,
                        arguments: {
                          'contact': '09874554',
                        });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 46.h,
                    width: 299.w,
                    child: Text(
                      'Gửi mã',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 20.sp,
                        //letterSpacing: -0.5,
                        fontWeight: FontWeight.normal,
                        //height: 0.7
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 494.h,
                  left: 60.w,
                  child: Text(
                    'Mã học sinh hoặc số điện thoại',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: const Color.fromRGBO(102, 102, 102, 1),
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.normal,
                        height: 0.875.h),
                  )),
              Positioned(
                  top: 0.h,
                  left: 21.w,
                  child: Container(
                      width: 348.w,
                      height: 309.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/forgot_password.png'),
                            fit: BoxFit.fitWidth),
                      ))),
            ]),
          ),
        ),
      ),
    );
  }
}
