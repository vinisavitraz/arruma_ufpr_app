import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../app/app_colors.dart';

class CustomTextInput extends StatelessWidget {

  final String textHint;
  final bool autoFocus;
  final int maxLength;
  final EdgeInsets paddingInfo;
  final String? errorMessage;
  final Function(String) onChanged;
  final TextEditingController inputEditController;
  final MaskTextInputFormatter? mask;
  final TextInputType keyboardType;
  final bool enabled;
  final int maxLines;
  final Color textColor;
  final Color textHintColor;

  const CustomTextInput({
    Key? key,
    required this.textHint,
    required this.onChanged,
    required this.errorMessage,
    required this.inputEditController,
    this.paddingInfo = const EdgeInsets.symmetric(vertical: 10),
    this.maxLength = 200,
    this.autoFocus = false,
    this.mask,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.maxLines = 1,
    this.textColor = AppColors.black,
    this.textHintColor = AppColors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingInfo,
      width: double.infinity,
      child: TextFormField(
        maxLines: maxLines,
        enabled: enabled,
        keyboardType: keyboardType,
        controller: inputEditController,
        autofocus: autoFocus,
        inputFormatters: _getFormats(),
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
          hintStyle: TextStyle(
            color: textHintColor,
          ),
        ),
        style: TextStyle(
          fontSize: 18,
          color: textColor,
        ),
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }

  List<TextInputFormatter> _getFormats() {
    if (mask != null) {
      return [
        LengthLimitingTextInputFormatter(maxLength),
        mask!
      ];
    }

    return [
      LengthLimitingTextInputFormatter(maxLength),
    ];
  }
}