import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/app_colors.dart';

class CustomTextInput extends StatelessWidget {

  final String textHint;
  final bool autoFocus;
  final int maxLength;
  final EdgeInsets paddingInfo;
  final String? errorMessage;
  final Function(String) onChanged;
  final TextEditingController inputEditController;
  //final MaskTextInputFormatter? mask;
  final TextInputType keyboardType;
  final bool enabled;

  const CustomTextInput({
    Key? key,
    required this.textHint,
    required this.onChanged,
    required this.errorMessage,
    required this.inputEditController,
    this.paddingInfo = const EdgeInsets.symmetric(vertical: 10),
    this.maxLength = 200,
    this.autoFocus = false,
    //this.mask,
    this.keyboardType = TextInputType.text,
    this.enabled = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingInfo,
      width: double.infinity,
      child: TextFormField(
        enabled: enabled,
        keyboardType: keyboardType,
        controller: inputEditController,
        autofocus: autoFocus,
        //inputFormatters: _getFormats(),
        decoration: InputDecoration(
          hintText: textHint,
          errorText: errorMessage,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(width: 4, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(width: 2, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(width: 4, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: const TextStyle(
            color: AppColors.grey,
          ),
        ),
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.black,
        ),
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }

  // List<TextInputFormatter> _getFormats() {
  //   if (mask != null) {
  //     return [
  //       LengthLimitingTextInputFormatter(maxLength),
  //       mask!
  //     ];
  //   }
  //
  //   return [
  //     LengthLimitingTextInputFormatter(maxLength),
  //   ];
  // }
}