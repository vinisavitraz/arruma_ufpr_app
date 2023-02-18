import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/src/ui/select_item.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class CustomSelectInput extends StatelessWidget {

  final MyTextField textField;
  final String textHint;
  final Function(String) onChanged;
  final List<SelectItem> options;
  final EdgeInsets paddingInfo;

  const CustomSelectInput({
    Key? key,
    required this.textField,
    required this.textHint,
    required this.onChanged,
    required this.options,
    this.paddingInfo = const EdgeInsets.symmetric(vertical: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingInfo,
      width: double.infinity,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: textHint,
          errorText: textField.errorMessage.value,
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
            fontSize: 18,
          ),
        ),
        isExpanded: true,
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.black,
        ),
        value: textField.getValue().isEmpty ? null : textField.getValue(),
        onChanged: (value) {
          onChanged(value.toString());
        },
        items: options.map((option) =>
            DropdownMenuItem(
              value: option.value,
              child: Text(option.text,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 18,
                ),
              ),
            )).toList(),
      ),
    );
  }

}