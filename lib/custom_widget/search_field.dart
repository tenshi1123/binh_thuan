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
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: keyBlack,
      ),
    );
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 10.h, left: 20.w, right: 20.w),
      child: TextField(
        style: defaultText14,
        controller: _controller,
        onSubmitted: (_) => _call(),
        decoration: widget.inputDecoration ??
            InputDecoration(
              hintText: 'search',
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 30,
                maxWidth: 30,
              ),
              enabledBorder: outlineInputBorder,
              border: outlineInputBorder,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: _call,
                  child: const CustomPaint(
                    size: Size.square(24),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
