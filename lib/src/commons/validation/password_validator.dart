import 'package:arruma_ufpr_app/ui/widgets/my_password_text_field.dart';

class PasswordValidator {

  static bool validatePasswords(MyPasswordTextField passwordField, MyPasswordTextField confirmPasswordField) {
    if (passwordField.getValue().length < 4) {
      passwordField.errorMessage.value = 'Senha precisa ter no mínimo 4 caracteres';
      return false;
    }

    if (confirmPasswordField.getValue().length < 4) {
      confirmPasswordField.errorMessage.value = 'Senha precisa ter no mínimo 4 caracteres';
      return false;
    }

    if (passwordField.getValue().length > 16) {
      passwordField.errorMessage.value = 'Senha precisa ter no máximo 16 caracteres';
      return false;
    }

    if (confirmPasswordField.getValue().length > 16) {
      confirmPasswordField.errorMessage.value = 'Senha precisa ter no máximo 16 caracteres';
      return false;
    }

    if (passwordField.getValue() != confirmPasswordField.getValue()) {
      confirmPasswordField.errorMessage.value = 'Informe a mesma senha nos dois campos';
      return false;
    }
    
    return true;
  }
  
}