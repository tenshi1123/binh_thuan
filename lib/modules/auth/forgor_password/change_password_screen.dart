import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/repo/repo/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController reNewPassController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    oldPassController.dispose();
    newPassController.dispose();
    reNewPassController.dispose();
    super.dispose();
  }

  void showErrorDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Đây là 1 cái icon'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text(
            'Yes',
            style: TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
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
        title: Text(
          'Đổi mật khẩu',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: keyBlack,
            fontFamily: 'Inter',
            fontSize: 20.sp,
            //letterSpacing: -0.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: 390.w,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '  Mật khẩu cũ',
                    style: defaultText14,
                  ),
                  Container(
                    width: 350.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: const Color(0xffDEE4ED),
                    ),
                    child: TextField(
                      controller: oldPassController,
                      style: defaultText16,
                      //focusNode: _focusNode,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).viewInsets.bottom),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    '  Mật khẩu mới',
                    style: defaultText14,
                  ),
                  Container(
                    width: 350.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: const Color(0xffDEE4ED),
                    ),
                    child: TextField(
                      style: defaultText16,
                      controller: newPassController,
                      //focusNode: _focusNode,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).viewInsets.bottom),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    '  Xác nhận mật khẩu mới',
                    style: defaultText14,
                  ),
                  Container(
                    width: 350.w,
                    height: 49.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: const Color(0xffDEE4ED),
                    ),
                    child: TextField(
                      style: defaultText16,
                      controller: reNewPassController,
                      //focusNode: _focusNode,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).viewInsets.bottom),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  if (oldPassController.text.isNotEmpty &&
                      newPassController.text == reNewPassController.text) {
                    LoginRepo().changePassword(
                      oldPass: oldPassController.text,
                      newPass: newPassController.text,
                    );
                    showErrorDialog(context, 'Đổi mật khẩu thành công');
                  }
                },
                child: Container(
                  height: 45.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Lưu mật khẩu',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
