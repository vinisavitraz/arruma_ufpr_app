import 'package:get/get.dart';

import 'my_text_field.dart';

class MyPasswordTextField extends MyTextField {

  final RxBool hideContent = true.obs;

  MyPasswordTextField({int maxLength = 100}) {
    this.maxLength = maxLength;
  }

  void show() {
    hideContent.value = !hideContent.value;
  }

}