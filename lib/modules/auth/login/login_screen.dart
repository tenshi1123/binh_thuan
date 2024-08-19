import 'dart:convert';

import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/login_model.dart';
import 'package:binh_thuan/models/subject_models.dart';
import 'package:binh_thuan/modules/notification/noti_repo.dart';
import 'package:binh_thuan/repo/repo/home_repo.dart';
import 'package:binh_thuan/repo/repo/login_repo.dart';
import 'package:binh_thuan/repo/repo/subject_repo.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crypto/crypto.dart';
import 'package:sp_util/sp_util.dart';
import 'package:binh_thuan/main.dart' as main;

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
                top: 452.h - MediaQuery.of(context).viewInsets.bottom,
                left: 52.w,
                child: Text(
                  'Mã học sinh',
                  style: defaultText14,
                ),
              ),
              Positioned(
                top: 472.h - MediaQuery.of(context).viewInsets.bottom,
                left: 46.w,
                child: Container(
                  width: 299.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: const Color(0xffDEE4ED),
                  ),
                  child: TextField(
                    style: defaultText16,
                    keyboardType: const TextInputType.numberWithOptions(),
                    controller: studenIdController,
                    //focusNode: _focusNode,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
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
                left: 52.w,
                child: Text(
                  'Mật khẩu',
                  style: defaultText14,
                ),
              ),
              Positioned(
                top: 562.h - MediaQuery.of(context).viewInsets.bottom,
                left: 46.w,
                child: Container(
                  width: 299.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: const Color(0xffDEE4ED),
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
                    ),
                    overflow: TextOverflow.clip,
                  )),
              Positioned(
                  top: 386.h - MediaQuery.of(context).viewInsets.bottom,
                  left: 46.h,
                  child: Text(
                    'Đăng nhập để tiếp tục sử dụng ứng dụng',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: 'Inter',
                      fontSize: 16.sp,
                      //letterSpacing: -0.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Positioned(
                top: 670.h - MediaQuery.of(context).viewInsets.bottom,
                left: 100.w,
                child: GestureDetector(
                  onTap: () async {
                    // "code": "2302682572",
                    // "password": "123456"
                    bool loged = await LoginRepo().login(
                        studenIdController?.text ?? '',
                        md5
                            .convert(utf8.encode(passController?.text ?? ''))
                            .toString());
                    if (loged == true) {
                      HomeModel info = await HomeRepo().home(
                          token: SpUtil.getString(ConstString.token) ?? '');
                      List<SubjectModels> listSubjectModels =
                          await SubjectRepo().subject(
                              token: SpUtil.getString(ConstString.token,
                                      defValue: null) ??
                                  '');
                      main.listNotification =
                          await NotificationRepo().getListMessages();
                      AppRouter.toPage(context, AppPages.NavigationBar,
                          arguments: {
                            'info': info,
                            'listSubjectModel': listSubjectModels
                          }
                          // blocValue: _authBloc,
                          );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text('Vui lòng thử lại'),
                            content: const Text(
                                'Vui lòng kiểm tra lại mã học sinh và mật khẩu của bạn'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                      fontSize: 20, color: kPrimaryColor),
                                ),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(
                                    (_) => false,
                                  );
                                },
                              )
                            ],
                          );
                        },
                      );
                    }
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
                  width: 340.w,
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
