class DoubleConverter {

  static double convert(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is int) {
      return value.toDouble();
    }

    return value;
  }

}