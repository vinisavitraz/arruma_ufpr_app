import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPasswordInput extends StatelessWidget {

  final String textHint;
  final bool autoFocus;
  final EdgeInsets paddingInfo;
  final String? errorMessage;
  final bool obscureText;
  final Function(String) onChanged;
  final Function() eyeClicked;
  final TextEditingController inputEditController;

  CustomPasswordInput({
    Key? key,
    required this.textHint,
    required this.onChanged,
    required this.eyeClicked,
    required this.errorMessage,
    required this.inputEditController,
    this.obscureText = true,
    this.autoFocus = false,
    this.paddingInfo = const EdgeInsets.symmetric(vertical: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingInfo,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: inputEditController,
                  obscureText: obscureText,
                  enableSuggestions: false,
                  autocorrect: false,
                  autofocus: autoFocus,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  decoration: InputDecoration(
                    hintText: textHint,
                    errorText: errorMessage,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: AppColors.primaryColor),
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
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Align(
          //         alignment: Alignment.centerRight,
          //         child: Padding(
          //           padding: const EdgeInsets.only(right: 20),
          //           child: InkWell(
          //             onTap: eyeClicked,
          //             child: AppIcon(
          //               obscureText ? AppIcons.show : AppIcons.hide,
          //               size: const Size(30, 30),
          //               color: AppColors.halfTermGrey,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}