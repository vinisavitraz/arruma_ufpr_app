import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

class NameValidator {

  static bool validate(MyTextField nameField) {
    if (nameField.getValue().isEmpty || nameField.getValue().length < 3) {
      nameField.errorMessage.value = 'Informe seu nome';
      return false;
    }

    if (nameField.getValue().isNumericOnly) {
      nameField.errorMessage.value = 'Nome inválido';
      return false;
    }

    nameField.errorMessage.value = '';

    return true;
  }

}