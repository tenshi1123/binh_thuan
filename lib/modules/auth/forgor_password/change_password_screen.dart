import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/modules/auth/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  TextEditingController? studenIdController = TextEditingController();
  void showErrorDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Đây là 1 cái icon'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const LoginScreen();
                },
              ),
              (_) => false,
            );
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //title: const Text("Sample"),
        centerTitle: true,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(),
        child: SafeArea(
          child: Stack(children: <Widget>[
            Positioned(
              top: 436.h,
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
                      color: kPrimaryColor.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(4, 7), // changes position of shadow
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
                    hintText: 'Mật khẩu mới (8-12 ký tự)',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 497.h,
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
                      color: kPrimaryColor.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(4, 7), // changes position of shadow
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
                    hintText: 'Xác nhận mật khẩu (8-12 ký tự)',
                  ),
                ),
              ),
            ),
            Positioned(
                top: 386.h,
                left: 135.h,
                child: Text(
                  'Đổi mật khẩu',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: 'Inter',
                    fontSize: 20.sp,
                    //letterSpacing: -0.5,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Positioned(
              top: 570.h,
              left: 46.w,
              child: GestureDetector(
                onTap: () {
                  showErrorDialog(context, 'Đổi mật khẩu thành công');
                },
                child: Container(
                  height: 45.h,
                  width: 299.w,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Xác minh',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0.h,
                left: 21.w,
                child: Container(
                    width: 348.w,
                    height: 309.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/change_pass.png'),
                          fit: BoxFit.fitWidth),
                    ))),
          ]),
        ),
      ),
    );
  }
}
