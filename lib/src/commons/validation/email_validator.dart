import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

class EmailValidator {

  static bool validate(MyTextField emailField) {
    if (emailField.getValue().isEmpty || !emailField.getValue().isEmail) {
      emailField.errorMessage.value = 'Informe um email válido. Ex: aaa@mail.com';
      return false;
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailField.getValue())) {
      emailField.errorMessage.value = 'Informe um email válido. Ex: aaa@mail.com';
      return false;
    }

    emailField.errorMessage.value = '';

    return true;
  }

}