import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyPieGraph extends StatelessWidget {
  final Map<String, double> sectors;
  const MyPieGraph({super.key, required this.sectors});

  final Map<String, Color> colors = const {
    'myjnia': Color.fromRGBO(23, 138, 119, 1),
    'tuning': Color.fromRGBO(110, 124, 122, 1),
    'naprawa': Color.fromRGBO(1, 170, 142, .1),
    'tankowanie': Color.fromRGBO(4, 114, 105, 1),
    'ubezpieczenie': Color.fromRGBO(172, 177, 176, 1),
    'przeglad': Color.fromRGBO(1, 252, 210, 1),
  };
  List<PieChartSectionData> _chartSections(Map<String, double> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors.keys) {
      const double radius = 40.0;
      final data = PieChartSectionData(
        color: colors[sector],
        value: getPercent(sectors[sector], sectors.values).roundToDouble(),
        radius: radius,
        title: '',
      );
      list.add(data);
    }
    return list;
  }

  double sum(sectors) {
    return sectors.fold(0, (sum, sec) => sum + sec);
  }

  double getPercent(sector, sectors) {
    if (sector == 0) {
      return 0;
    }
    double suma = sum(sectors);
    return 100 * sector / suma;
  }

  List<Widget> getLegendItems() {
    List<Widget> legendItems = [];

    sectors.forEach((key, value) {
      final legendItem = Chip(
        backgroundColor: Colors.transparent,
        label: Text(
            '$key - ${getPercent(sectors[key], sectors.values).toStringAsFixed(2)}%'),
        avatar: CircleAvatar(backgroundColor: colors[key]),
      );
      legendItems.add(legendItem);
    });
    return legendItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  centerSpaceRadius: 48.0,
                  sections: sum(sectors.values) > 0
                      ? _chartSections(sectors)
                      : [
                          PieChartSectionData(
                            color: Colors.grey[300],
                            value: 1,
                            title: '',
                          )
                        ],
                ),
              ),
              Center(
                child: Text(
                  sum(sectors.values) > 0
                      ? '${sum(sectors.values)}'
                      : 'Brak danych',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 2.0,
          children: getLegendItems(),
        )
      ],
    );
  }
}
