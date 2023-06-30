class Expense {
  int id;
  String title;
  DateTime date;
  String tag;
  double cost;
  int count;
  String place;
  String city;
  int mileage;

  Expense({
    required this.id,
    required this.title,
    required this.cost,
    required this.date,
    required this.tag,
    this.count = 1,
    this.place = '-',
    this.city = '-',
    this.mileage = 0,
  });
}