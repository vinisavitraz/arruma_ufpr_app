class TextFieldUtil {

  static String removeSpecialCharacters(String value) {
    return value.replaceAll(RegExp('[^A-Za-z0-9 ]'), '');
  }

}