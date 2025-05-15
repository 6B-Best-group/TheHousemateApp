
// these are quality of life functions for formatting

String convertDatetimeToMonth(DateTime time) {
    // add this to a functions list
    int month = time.month;

    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "Error, Try again";
    }
  }

String convertDayToTh(int day) {
    switch (day) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

String convertDatetimeToWeekday(DateTime time) {
    // add this to a functions list
    int weekday = time.weekday;

    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Error, Try again";
    }
  }

String convertToMonthYear(DateTime date){
  return "${convertDatetimeToMonth(date)}  ${date.year}";
}