import 'single_bar.dart';

class BarData {
  final double janAmount;
  final double febAmount;
  final double marAmount;
  final double aprAmount;
  final double mayAmount;
  final double junAmount;
  final double julAmount;
  final double augAmount;
  final double sepAmount;
  final double octAmount;
  final double novAmount;
  final double decAmount;

  BarData({
    required this.janAmount,
    required this.febAmount,
    required this.marAmount,
    required this.aprAmount,
    required this.mayAmount,
    required this.junAmount,
    required this.julAmount,
    required this.augAmount,
    required this.sepAmount,
    required this.octAmount,
    required this.novAmount,
    required this.decAmount,
  });

  List<SingleBar> barData = [];

  void initializeBarData(){
    barData = [
      SingleBar(x: 0,y: janAmount),
      SingleBar(x: 1,y: febAmount),
      SingleBar(x: 2,y: marAmount),
      SingleBar(x: 3,y: aprAmount),
      SingleBar(x: 4,y: mayAmount),
      SingleBar(x: 5,y: junAmount),
      SingleBar(x: 6,y: julAmount),
      SingleBar(x: 7,y: augAmount),
      SingleBar(x: 8,y: sepAmount),
      SingleBar(x: 9,y: octAmount),
      SingleBar(x: 10,y: novAmount),
      SingleBar(x: 11,y: decAmount),
    ];
  }
}
