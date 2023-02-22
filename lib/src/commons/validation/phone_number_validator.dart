import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

class PhoneNumberValidator {

  static const List<String> BLACKLIST = [
    "00000000000",
    "11111111111",
    "22222222222",
    "33333333333",
    "44444444444",
    "55555555555",
    "66666666666",
    "77777777777",
    "88888888888",
    "99999999999",
    "12345678909"
  ];

  static bool validate(MyTextField phoneNumberField) {
    String phoneNumber = phoneNumberField.maskFormatter!.getUnmaskedText();

    if (phoneNumber.isEmpty || !phoneNumber.isNumericOnly) {
      phoneNumberField.errorMessage.value = 'Informe seu telefone';
      return false;
    }

    if (!_validatePhoneNumber(phoneNumber)) {
      phoneNumberField.errorMessage.value = 'Telefone inválido';
      return false;
    }

    phoneNumberField.errorMessage.value = '';

    return true;
  }

  static bool _validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }

    if (BLACKLIST.indexOf(phoneNumber) != -1) {
      return false;
    }

    if (!(phoneNumber.length >= 10 && phoneNumber.length <= 11)) {
      return false;
    }

    return true;
  }
}