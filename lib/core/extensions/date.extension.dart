// Extension for number
extension NumberExtension on DateTime {
  List<DateTime> get getWeekDates {
    // Calculate start date (current day)
    DateTime startDate = this;

    // Generate list of dates for the week starting from current day
    List<DateTime> weekDates = List.generate(7, (index) {
      return startDate.add(Duration(days: index));
    });

    return weekDates;
  }
}
