class DateFormatter {

  static String formatStringToDDMMYYHHMMSS(String dateTimeString) {
    print('formatStringToDDMMYYHHMMSS');
    print(dateTimeString);
    var dateTimeArray = dateTimeString.split(' ');
    var dateString = dateTimeArray[0];
    var timeString = dateTimeArray[1];

    return toDayMonthAndYear(dateString) + ' às ' + toHourAndMinute(timeString);
  }

  static String formatStringToDDMMYYHHMM(String dateTimeString) {
    print('formatStringToDDMMYYHHMM');
    print(dateTimeString);
    var dateTimeArray = dateTimeString.split(' ');
    var dateString = dateTimeArray[0];
    var timeString = dateTimeArray[1];
    
    return toDayMonthAndYear(dateString) + ' às ' + toHourAndMinute(timeString);
  }

  static String formatStringToDDMMYY(String dateTimeString) {
    var dateTimeArray = dateTimeString.split(' ');
    var dateString = dateTimeArray[0];

    return toDayMonthAndYear(dateString);
  }

  static String formatStringToDDMM(String dateTimeString) {
    var dateTimeArray = dateTimeString.split(' ');
    var dateString = dateTimeArray[0];

    return toDayAndMonth(dateString);
  }

  static String formatStringToYYYYMMDD(String dateString) {
    String birthDateDay = dateString.substring(0, 2);
    String birthDateMonth = dateString.substring(2, 4);
    String birthDateYear = dateString.substring(4);

    return "$birthDateYear-$birthDateMonth-$birthDateDay";
  }

  static String formatStringToHHMM(String dateTimeString) {
    var dateTimeArray = dateTimeString.split(' ');
    var timeString = dateTimeArray[1];

    return toHourAndMinute(timeString);
  }
  
  static String toDayMonthAndYear(String dateString) {
    var dateArray = dateString.split('-');
    var day = dateArray[2];
    var month = dateArray[1];
    var year =  dateArray[0];
    return '$day/$month/$year';
  }

  static String toHourAndMinute(String timeString) {
    var timeArray = timeString.split(':');
    var hour = timeArray[0];
    var minute = timeArray[1];
    return '$hour:$minute';
  }

  static String toDayAndMonth(String dateString) {
    var dateArray = dateString.split('-');
    var day = dateArray[2];
    var month = dateArray[1];
    return '$day/$month';
  }

}