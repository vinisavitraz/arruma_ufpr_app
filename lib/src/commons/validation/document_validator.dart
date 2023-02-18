import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

class DocumentValidator {

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
  static const STRIP_REGEX = r'[^\d]';

  static bool validate(MyTextField documentField) {
    String document = documentField.maskFormatter!.getUnmaskedText();

    if (document.isEmpty) {
      documentField.errorMessage.value = 'Informe seu CPF';
      return false;
    }

    String cpf = _strip(document);

    if (cpf.isEmpty || !cpf.isNumericOnly) {
      documentField.errorMessage.value = 'CPF inválido';
      return false;
    }

    if (!_validateDocumentDigits(document)) {
      documentField.errorMessage.value = 'CPF inválido';
      return false;
    }

    documentField.errorMessage.value = '';

    return true;
  }

  static int _verifierDigit(String cpf) {
    List<int> numbers =
    cpf.split("").map((number) => int.parse(number, radix: 10)).toList();

    int modulus = numbers.length + 1;

    List<int> multiplied = [];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  static String _strip(String? cpf) {
    RegExp regExp = RegExp(STRIP_REGEX);
    cpf = cpf ?? "";

    return cpf.replaceAll(regExp, "");
  }

  static bool _validateDocumentDigits(String cpf) {
    if (cpf.length != 11) {
      return false;
    }

    if (BLACKLIST.contains(cpf)) {
      return false;
    }

    String numbers = cpf.substring(0, 9);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) ==
        cpf.substring(cpf.length - 2);
  }
}