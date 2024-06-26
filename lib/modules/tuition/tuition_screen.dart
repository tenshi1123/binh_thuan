import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/tuition/custom_widget_tuition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TuitionScreen extends StatelessWidget {
  const TuitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.h),
        child: AppBar(
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios_new_outlined, color: keyWhite),
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: SizedBox(
            height: 200.h,
            child: Stack(
              children: [
                Image(
                  height: 125.h,
                  width: MediaQuery.of(context).size.width,
                  image:
                      const AssetImage('assets/images/appbar_background.png'),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 150.w,
                  top: 50.h,
                  child: Text(
                    'Sổ học phí',
                    style: defaultText20.copyWith(
                        color: keyWhite, fontWeight: FontWeight.w800),
                  ),
                ),
                Positioned(
                  top: 125.h,
                  child: Container(
                    height: 74.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.4),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset:
                              const Offset(4, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Chi phí còn thiếu ',
                          style: defaultText16.copyWith(
                            color: keyBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.w, vertical: 6.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18.r),
                              ),
                              color: color9B9),
                          child: Text(
                            '2.350.000 VND',
                            style: defaultText16.copyWith(
                              color: keyWhite,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            const NotyetItem(),
            SizedBox(
              height: 20.h,
            ),
            const NotEnoughItem(),
            SizedBox(
              height: 20.h,
            ),
            const CompleteItem(),
            SizedBox(
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}
