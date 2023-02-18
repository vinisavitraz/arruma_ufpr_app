import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextField {

  final RxString content = ''.obs;
  final RxnString errorMessage = RxnString(null);
  final TextEditingController editController = TextEditingController();
  late int maxLength;
  MaskTextInputFormatter? maskFormatter;
  late String mask;

  MyTextField({int maxLength = 100, String mask = ''}) {
    this.maxLength = maxLength;
    this.mask = mask;
    maskFormatter = mask.isEmpty ? null : MaskTextInputFormatter(mask: mask);
  }

  String getValue() {
    return content.value;
  }

  void setValue(String content) {
    errorMessage.value = null;

    if (content.length > maxLength) {
      return;
    }

    if (mask.isNotEmpty) {
      maskFormatter = MaskTextInputFormatter(mask: mask, initialText: content);
    }

    int offset = _getNewOffset(this.content.value, content);
    this.content.value = content;

    editController.value = TextEditingValue(
      text: content,
      selection: TextSelection.fromPosition(
        TextPosition(offset: offset),
      ),
    );
  }

  int _getNewOffset(String content, String newContent) {
    int maxValue = (content.length >= newContent.length) ? content.length : newContent.length;
    int positionOffset = newContent.length;

    if (content.isEmpty) {
      return positionOffset;
    }

    for (int i = 0; i < maxValue; i++) {
      if (content.length <= i || newContent.length <= i) {
        if (content.length == i) {
          return newContent.length;
        }

        return i;
      }

      if (content[i] != newContent[i]) {
        if (newContent.length > content.length) {
          return i + 1;
        }

        return i;
      }
    }

    return positionOffset;
  }

}