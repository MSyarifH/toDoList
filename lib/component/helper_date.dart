abstract class DateHandler {
  void displayDate();
}

class CurrentDate extends DateHandler {
  // polymorphism fungsi displayDate ditambahkan data yang lain
  @override
  void displayDate() {
    DateTime now = DateTime.now();
    print("Current date: ${now.day}/${now.month}/${now.year}");
  }
}
