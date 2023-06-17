abstract class DateHandler {
  void displayDate();
}

class CurrentDate extends DateHandler {
  @override
  void displayDate() {
    DateTime now = DateTime.now();
    print("Current date: ${now.day}/${now.month}/${now.year}");
  }
}

class CustomDate extends DateHandler {
  final int day;
  final int month;
  final int year;

  CustomDate(this.day, this.month, this.year);

  @override
  void displayDate() {
    print("Custom date: $day/$month/$year");
  }
}