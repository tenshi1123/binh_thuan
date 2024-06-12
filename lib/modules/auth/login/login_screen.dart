import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _focusNode = FocusNode();
  TextEditingController? passController = TextEditingController();
  TextEditingController? studenIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(),
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              _focusNode.unfocus();
            },
            child: Stack(children: <Widget>[
              Positioned(
                top: 476.h - MediaQuery.of(context).viewInsets.bottom,
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
                        offset:
                            const Offset(4, 7), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: studenIdController,
                    //focusNode: _focusNode,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Mã học sinh',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 542.h - MediaQuery.of(context).viewInsets.bottom,
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
                        offset:
                            const Offset(4, 7), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: passController,
                    focusNode: _focusNode,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Mật khẩu',
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 600.h - MediaQuery.of(context).viewInsets.bottom,
                  left: 225.w,
                  child: TextButton(
                    onPressed: () {
                      AppRouter.toPage(
                        context,
                        AppPages.ForgotPassScreen,
                        // blocValue: _authBloc,
                        arguments: {},
                      );
                    },
                    child: Text(
                      'Quên mật khẩu ?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: 'Inter',
                          fontSize: 16.sp,
                          //letterSpacing: -0.5,
                          fontWeight: FontWeight.normal,
                          height: 0.875.h),
                    ),
                  )),
              Positioned(
                  top: 408.h - MediaQuery.of(context).viewInsets.bottom,
                  left: 60.w,
                  child: Text(
                    'Thông tin đăng nhập được cung cấp bởi nhà trường',
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
                  top: 386.h - MediaQuery.of(context).viewInsets.bottom,
                  left: 46.h,
                  child: Text(
                    'Đăng nhập để tiếp tục sử dụng ứng dụng',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        //letterSpacing: -0.5,
                        fontWeight: FontWeight.bold,
                        height: 1.1666666666666667.h),
                  )),
              Positioned(
                top: 670.h - MediaQuery.of(context).viewInsets.bottom,
                left: 130.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    AppRouter.toPage(
                      context, AppPages.NavigationBar,
                      // blocValue: _authBloc,
                    );
                  },
                  child: Text(
                    'Đăng nhập',
                    textAlign: TextAlign.center,
                    style: defaultText20.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 56.h - MediaQuery.of(context).viewInsets.bottom,
                left: 21.w,
                child: Container(
                  width: 348.w,
                  height: 309.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
