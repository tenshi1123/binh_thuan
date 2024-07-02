import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'debouncer/text_editing_controler.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    this.callBack,
    this.inputDecoration,
  });

  final ValueChanged<String>? callBack;
  final InputDecoration? inputDecoration;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingControllerDebouncer _debouncer;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _debouncer = TextEditingControllerDebouncer(_call, controller: _controller);
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  _call() {
    widget.callBack!(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 320.w,
      decoration: BoxDecoration(
        color: rec14Marine,
        borderRadius: BorderRadius.all(
          Radius.circular(38.r),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 12.w,
          ),
          const Icon(
            Icons.search_sharp,
            color: rec12Marine,
          ),
          SizedBox(
            height: 40.h,
            width: 200.w,
            child: TextField(
              style: defaultText16,
              //controller: studenIdController,
              //focusNode: _focusNode,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom),
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Tìm kiếm: Tin nhắn, liên hệ,...',
                hintStyle: defaultText14.copyWith(
                  color: rec12Marine,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
