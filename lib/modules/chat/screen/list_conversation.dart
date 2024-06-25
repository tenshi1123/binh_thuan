import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/custom_widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListConversation extends StatelessWidget {
  const ListConversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.h,
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
                left: 250.w,
                bottom: 22.h,
                child: Text(
                  'Tin nhắn',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            SizedBox(
              height: 8.h,
            ),
            const ConversationItem(
              icon: 'assets/icons/wallet.svg',
              title: 'GVCV',
              title2: 'Lorem ipsum dolor sit amet, consectetur adipisci...',
              time: '18:06',
              isRead: false,
            ),
            const ConversationItem(
              icon: 'assets/icons/wallet.svg',
              title: 'Tenshii',
              title2: 'Lorem ipsum dolor sit amet, consectetur adipisci...',
              time: '18:06',
              isRead: true,
            ),
            const ConversationItem(
              icon: 'assets/icons/wallet.svg',
              title: 'Catarina',
              title2: 'Lorem ipsum dolor sit amet, consectetur adipisci...',
              time: '18:06',
              isRead: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  final String icon;
  final String title;
  final String title2;
  final String time;
  final bool isRead;
  const ConversationItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.title2,
      required this.time,
      required this.isRead});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      height: 68.h,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              CircleAvatar(
                radius: 20.r, // Image radius
                backgroundImage: const AssetImage(
                  'assets/images/placeholder_avatar.png',
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              SizedBox(
                width: 250.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: defaultBoldText.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      title2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: defaultText12.copyWith(
                          color: isRead ? keyBlack.withOpacity(0.5) : keyBlack),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: defaultText12,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  isRead
                      ? const SizedBox()
                      : Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: rec21Red,
                          ),
                        ),
                ],
              ),
            ],
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
