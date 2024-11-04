import 'dart:io';

import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/custom_widget/fullscreen_image.dart';
import 'package:binh_thuan/modules/exercise/exercise_model.dart';
import 'package:binh_thuan/repo/repo/excercise_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class DetailsExercise extends StatefulWidget {
  const DetailsExercise({super.key, required this.model});
  final ExcerciseModel model;
  @override
  State<DetailsExercise> createState() => _DetailsExerciseState();
}

class _DetailsExerciseState extends State<DetailsExercise> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  ValueNotifier<bool> isSubmit = ValueNotifier(false);
  late ExcerciseModel _model;
  @override
  void initState() {
    // TODO: implement initState
    _model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      text: '<  Bài tập',
                      style: defaultBoldText.copyWith(
                        fontSize: 14.sp,
                        color: keyBlack,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(
                    width: 240.w,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              InfoEssayExcercise(
                model: _model,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Bài làm',
                style: defaultBoldText.copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 240.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: imageFileList!.isEmpty
                      ? Text(
                          'Chưa nộp bài làm nào',
                          style: defaultText14,
                        )
                      : GridView.builder(
                          itemCount: imageFileList!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Image.file(
                              File(imageFileList![index].path),
                              fit: BoxFit.cover,
                            );
                          }),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectImages();
                },
                child: Container(
                  height: 57.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                      border: Border.all(
                        color: kPrimaryColor,
                      ),
                      color: Colors.white),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 110.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/add_excersice.svg',
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Thêm bài làm',
                          style: defaultBoldText.copyWith(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // ValueListenableBuilder(
              //   valueListenable: isSubmit,
              //   builder: (BuildContext context, value, Widget? child) {
              //     return GestureDetector(
              //       onTap: () {
              //         isSubmit.value = true;
              //       },
              //       child: Container(
              //         height: 57.h,
              //         width: 350.w,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(8.r),
              //             ),
              //             border: Border.all(
              //               color: Colors.white,
              //             ),
              //             color: isSubmit.value
              //                 ? const Color(0xffC1CFE4)
              //                 : kPrimaryColor),
              //         child: Center(
              //           child: Text(
              //             isSubmit.value ? 'Đã nộp bài' : 'Nộp bài',
              //             style: defaultBoldText.copyWith(
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void selectImages() async {
    // final returnedImage = await ImagePicker().pickMultiImage();
    // photos = List<File>.from(
    //   (returnedImage).map(
    //     (e) => File(e.path),
    //   ),
    // );
    // //File(returnedImage!.path);
    // if (photos.isNotEmpty) {
    //   ChatRepo().sendImageMessage(widget.groupId, photos);
    // }
    // setState(() {});
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    var photos = List<File>.from(
      (selectedImages).map(
        (e) => File(e.path),
      ),
    );
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      ExcerciseRepo().submitEssay('', photos);
    }
    setState(() {});
  }
}

class InfoEssayExcercise extends StatelessWidget {
  const InfoEssayExcercise({super.key, required this.model});
  final ExcerciseModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 344.h,
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
                  '--  ',
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
                      width: 81.w,
                      height: 21.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        color: kPrimaryColor,
                      ),
                      child: Center(
                        child: Text(
                          'Tự luận',
                          style: defaultBoldText.copyWith(
                            color: Colors.white,
                            fontSize: 12.w,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 253.w,
                  child: Text(
                    model.name,
                    style: defaultBoldText.copyWith(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6.h),
                  height: 1.h,
                  width: 300.w,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                // Text(
                //   'Mô tả',
                //   style: defaultBoldText.copyWith(fontSize: 20),
                //   overflow: TextOverflow.ellipsis,
                //   maxLines: 2,
                // ),
                // SizedBox(
                //   width: 320.w,
                //   child: Text(
                //     'Bất đẳng thức Cosi là một trong những kiến thức toán học phổ biến, được sử dụng để giải nhiều dạng toán về phương trình và bất phương trình khác nhau cũng như tìm giá trị lớn nhất và giá trị nhỏ nhất của biểu thức. Trong bài viết này,',
                //     style: defaultText14,
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 3,
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Tệp đính kèm',
                  style: defaultBoldText.copyWith(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        opaque: false,
                        barrierColor: Colors.black,
                        pageBuilder: (BuildContext context, _, __) {
                          return FullScreenPage(
                            dark: true,
                            child: Image.network(
                              model.urlFile,
                              width: 100.w,
                              height: 90.h,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Image.network(
                    model.urlFile,
                    width: 300.w,
                    height: 250.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
