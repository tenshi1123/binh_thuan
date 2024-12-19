import 'dart:io';

import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/chat_model.dart';
import 'package:binh_thuan/repo/repo/chat_repo.dart';
import 'package:binh_thuan/repo/repo/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:camera_camera/camera_camera.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ChatScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  final List<MessageModel> listMessage;
  const ChatScreen({
    super.key,
    required this.groupId,
    required this.groupName,
    required this.userName,
    required this.listMessage,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<MessageModel> listMessage;
  TextEditingController messageController = TextEditingController();
  List<File> photos = <File>[];
  void openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          onFile: (file) {
            photos.add(file);
            //Navigator.pop(context);
            ChatRepo().sendImageMessage(widget.groupId, photos);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('Tin nhắn đã được gửi'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: const Text(
                        'ok',
                        style: TextStyle(fontSize: 20, color: kPrimaryColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
            setState(() {});
          },
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    //final returnedImage = await ImagePicker().pickMultiImage();
    // photos = List<File>.from(
    //   (returnedImage).map(
    //     (e) => File(e.path),
    //   ),
    // );
    //File(returnedImage!.path);
    // if (photos.isNotEmpty) {
    //   ChatRepo().sendImageMessage(widget.groupId, photos);
    // }
    // setState(() {});
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      await ChatRepo().sendImageMessage(widget.groupId, [file]);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Thông báo',
              style: defaultText14,
            ),
            content: Text(
              'Bạn đã gửi thành công',
              style: defaultText14,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    //_isLoading = false;
                  });
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    listMessage = widget.listMessage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 390.w,
        backgroundColor: kPrimaryColor,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            Container(
              height: 36.h,
              width: 36.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              widget.groupName,
              style: defaultBoldText.copyWith(color: Colors.white),
            ),
            // SizedBox(
            //   width: 150.w,
            // ),
            //SvgPicture.asset('assets/icons/group.svg')
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: listMessage.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 50.h),
            reverse: true,
            //physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: ((listMessage[index].senderType == "1" &&
                          listMessage[index].senderId == LoginRepo.idUser)
                      ? Alignment.topRight
                      : Alignment.topLeft),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ((listMessage[index].senderType == "1" &&
                              listMessage[index].senderId == LoginRepo.idUser)
                          ? kPrimaryColor
                          : rec14Marine),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: (listMessage[index].messageType == '0')
                        ? Text(
                            listMessage[index].content,
                            style: defaultText14.copyWith(
                              color: ((listMessage[index].senderType == "1" &&
                                      listMessage[index].senderId ==
                                          LoginRepo.idUser)
                                  ? keyWhite
                                  : keyBlack),
                            ),
                          )
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  listMessage[index].content.length == 1
                                      ? 1
                                      : 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: listMessage[index].content.length,
                            itemBuilder: (context, index2) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => FullsizeImage(
                                            url: listMessage[index]
                                                .content[index2],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      listMessage[index].content[index2],
                                      height:
                                          listMessage[index].content.length == 1
                                              ? 250.h
                                              : 125.h,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              margin: EdgeInsets.only(bottom: 6.h),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        openCamera();
                      },
                      child: SvgPicture.asset('assets/icons/camera_icon.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                  // pick file nhe`
                  GestureDetector(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SvgPicture.asset('assets/icons/picture_icon.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: rec14Marine,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                            hintText: "Nhập tin nhắn...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                        style: defaultText14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                      onTap: () async {
                        if (messageController.text.isNotEmpty) {
                          await ChatRepo().sendTextMessage(
                              widget.groupId, messageController.text);

                          setState(() {
                            widget.listMessage.insert(
                              0,
                              MessageModel(
                                  content: messageController.text,
                                  messageType: "0",
                                  senderId: LoginRepo.idUser ?? '',
                                  senderType: "1",
                                  createdAt: DateTime.now(),
                                  teacherName: '',
                                  studentName: '',
                                  teacherAvatar: ''),
                            );
                          });
                          messageController.clear();

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: const Text('Tin nhắn đã được gửi'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    child: const Text(
                                      'ok',
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
                      child:
                          SvgPicture.asset('assets/icons/plane_outline.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullsizeImage extends StatelessWidget {
  const FullsizeImage({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: InteractiveViewer(
            panEnabled: true,
            boundaryMargin: const EdgeInsets.all(200),
            minScale: 0.5,
            maxScale: 4,
            child: Image.network(
              url,
              fit: BoxFit.fitWidth,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
