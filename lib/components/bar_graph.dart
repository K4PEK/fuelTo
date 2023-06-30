import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fuelto/controls/graphs/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final Map<int, double> yearlySummary;
  const MyBarGraph({
    super.key,
    required this.yearlySummary,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      janAmount: yearlySummary[1] ?? 0,
      febAmount: yearlySummary[2] ?? 0,
      marAmount: yearlySummary[3] ?? 0,
      aprAmount: yearlySummary[4] ?? 0,
      mayAmount: yearlySummary[5] ?? 0,
      junAmount: yearlySummary[6] ?? 0,
      julAmount: yearlySummary[7] ?? 0,
      augAmount: yearlySummary[8] ?? 0,
      sepAmount: yearlySummary[9] ?? 0,
      octAmount: yearlySummary[10] ?? 0,
      novAmount: yearlySummary[11] ?? 0,
      decAmount: yearlySummary[12] ?? 0,
    );
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: yearlySummary.values.reduce(
                    (value1, value2) => value1 > value2 ? value1 : value2) <
                200
            ? 200
            : yearlySummary.values
                .reduce((value1, value2) => value1 > value2 ? value1 : value2),
        minY: 0,
        gridData: FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles)),
        ),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: const Color.fromRGBO(1, 170, 142, 1),
                      width: 14,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        color: const Color.fromRGBO(1, 170, 142, .1),
                        show: true,
                        toY: yearlySummary.values.reduce((value1, value2) =>
                                    value1 > value2 ? value1 : value2) <
                                200
                            ? 200
                            : yearlySummary.values.reduce((value1, value2) =>
                                value1 > value2 ? value1 : value2),
                      )),
                ]))
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'S',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'L',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'M',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'K',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'M',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'C',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'L',
        style: style,
      );
      break;
    case 7:
      text = const Text(
        'S',
        style: style,
      );
      break;
    case 8:
      text = const Text(
        'W',
        style: style,
      );
      break;
    case 9:
      text = const Text(
        'P',
        style: style,
      );
      break;
    case 10:
      text = const Text(
        'L',
        style: style,
      );
      break;
    case 11:
      text = const Text(
        'G',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
