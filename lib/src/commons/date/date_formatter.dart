class DateFormatter {

  static String formatStringDateTimeToReadableFormat(String dateTimeString) {
    final DateTime now = DateTime.now();
    final DateTime dateTime = DateTime.parse(dateTimeString);

    final int nowDay = now.day;
    final int nowMonth = now.month;
    final int nowYear = now.year;

    final int dateTimeDay = dateTime.day;
    final int dateTimeMonth = dateTime.month;
    final int dateTimeYear = dateTime.year;

    if (nowYear == dateTimeYear && nowMonth == dateTimeMonth && nowDay == dateTimeDay) {
      final int hoursAgo = calculateDifferenceInHours(now, dateTime);

      if (hoursAgo < 1) {
        final int minutesAgo = calculateDifferenceInMinutes(now, dateTime);

        return '${minutesAgo}m atrás';
      }

      return '${hoursAgo}h atrás';
    }

    return toReadableFormat(dateTimeDay, dateTimeMonth);
  }

  static String toReadableFormat(int day, int month) {
    final String formattedDay = day <= 9 ? '0$day' : day.toString();

    return '${getMonthAbbreviation(month.toString())} $formattedDay';
  }

  static String getMonthAbbreviation(String month) {
    switch(month) {
      case '1':
        return 'Jan';
      case '2':
        return 'Fev';
      case '3':
        return 'Mar';
      case '4':
        return 'Abr';
      case '5':
        return 'Mai';
      case '6':
        return 'Jun';
      case '7':
        return 'Jul';
      case '8':
        return 'Ago';
      case '9':
        return 'Set';
      case '10':
        return 'Out';
      case '11':
        return 'Nov';
      case '12':
        return 'Dez';
      default:
        return '';
    }
  }

  static int calculateDifferenceInHours(DateTime dateA, DateTime dateB) {
    return dateA.difference(dateB).inHours;
  }

  static int calculateDifferenceInMinutes(DateTime dateA, DateTime dateB) {
    return dateA.difference(dateB).inMinutes;
  }

  static String formatStringToDDMMYYHHMMSS(String dateTimeString) {
    var dateTimeArray = dateTimeString.split(' ');
    var dateString = dateTimeArray[0];
    var timeString = dateTimeArray[1];

    return toDayMonthAndYear(dateString) + ' às ' + toHourAndMinute(timeString);
  }

  static String formatStringToDDMMYYHHMM(String? dateTimeString) {
    if (dateTimeString == null) {
      return '';
    }
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