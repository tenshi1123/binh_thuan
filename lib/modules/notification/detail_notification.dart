import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/notification/noti_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailNotification extends StatelessWidget {
  const DetailNotification({super.key, required this.notification});
  final NotiModel notification;
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
                left: 150.w,
                bottom: 22.h,
                child: Text(
                  'Chi tiết thông báo',
                  style: defaultBoldText.copyWith(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: Text(
              notification.headings,
              style: defaultBoldText,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: HtmlWidget(
              notification.contents,
              //'av Euterpe was born as one of the daughters of Mnemosyne, Titan goddess of memory, and fathered by Zeus, god of the gods. Her sisters include Calliope (muse of epic poetry), Clio (muse of history), Melpomene (muse of tragedy), Terpsichore (muse of dancing), Erato (muse of erotic poetry), Thalia (muse of comedy), Polyhymnia (muse of hymns), and Urania (muse of astronomy). Sometimes they are referred to as water nymphs having been born from the four sacred springs on Helicon which flowed from the ground after Pegasus, the winged horse, stamped his hooves on the ground. The mountain spring on Mount Parnassus was sacred to Euterpe and the other Muses. It flowed between two high rocks above the city of Delphi, and in ancient times its sacred waters were introduced into a square stone basin, where they were retained for the usea',
              textStyle: defaultText14,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          notification.link == ''
              ? const SizedBox()
              : GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(Uri.parse(notification.link))) {
                      throw Exception('Could not launch ');
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 32.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                          color: Colors.blue,
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Center(
                        child: Text(
                          'Mở trình duyệt',
                          style: defaultText12.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Nunito-Bold'),
                        ),
                      ),
                    ),
                  ),
                ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
