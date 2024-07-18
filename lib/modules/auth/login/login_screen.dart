import 'dart:convert';

import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/models/login_model.dart';
import 'package:binh_thuan/models/models/subject_models.dart';
import 'package:binh_thuan/repo/repo/login_repo.dart';
import 'package:binh_thuan/repo/repo/subject_repo.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crypto/crypto.dart';
import 'package:sp_util/sp_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
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
                        color: kPrimaryColor.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(4, 6), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: TextField(
                    style: defaultText16,
                    controller: studenIdController,
                    //focusNode: _focusNode,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Mã học sinh',
                      hintStyle: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff999999),
                      ),
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
                        color: kPrimaryColor.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(4, 6), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: TextField(
                    obscureText: _isObscure,
                    obscuringCharacter: "*",
                    controller: passController,
                    focusNode: _focusNode,
                    style: defaultText16,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Mật khẩu',
                      hintStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff999999),
                      ),
                      suffix: IconButton(
                        padding: const EdgeInsets.all(0),
                        iconSize: 20.0,
                        icon: _isObscure
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //     top: 600.h - MediaQuery.of(context).viewInsets.bottom,
              //     left: 225.w,
              //     child: TextButton(
              //       onPressed: () {
              //         AppRouter.toPage(
              //           context,
              //           AppPages.ForgotPassScreen,
              //           // blocValue: _authBloc,
              //           arguments: {},
              //         );
              //       },
              //       child: Text(
              //         'Quên mật khẩu ?',
              //         textAlign: TextAlign.right,
              //         style: TextStyle(
              //             color: kPrimaryColor,
              //             fontFamily: 'Inter',
              //             fontSize: 16.sp,
              //             //letterSpacing: -0.5,
              //             fontWeight: FontWeight.normal,
              //             height: 0.875.h),
              //       ),
              //     )),
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
                left: 100.w,
                child: GestureDetector(
                  onTap: () async {
                    // "code": "2302682572",
                    // "password": "123456"
                    HomeModel info = await LoginRepo().login(
                        studenIdController?.text ?? '',
                        md5
                            .convert(utf8.encode(passController?.text ?? ''))
                            .toString());
                    List<SubjectModels> listSubjectModels = await SubjectRepo()
                        .subject(
                            token: SpUtil.getString(ConstString.token,
                                    defValue: '') ??
                                '');
                    AppRouter.toPage(context, AppPages.NavigationBar,
                        arguments: {
                          'info': info,
                          'listSubjectModel': listSubjectModels
                        }
                        // blocValue: _authBloc,
                        );
                  },
                  child: Container(
                    height: 48.h,
                    width: 191.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'Đăng nhập',
                        textAlign: TextAlign.center,
                        style: defaultText20.copyWith(color: Colors.white),
                      ),
                    ),
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
