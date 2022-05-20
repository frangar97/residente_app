import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class AccountChart extends StatefulWidget {
  const AccountChart({Key? key}) : super(key: key);

  @override
  State<AccountChart> createState() => _AccountChartState();
}

class _AccountChartState extends State<AccountChart> {
  final dataMap = <String, double>{
    "Ingresos": 5000,
    "Gastos": 3000,
  };

  final colorList = const <Color>[
    Color(0xff0984e3),
    Color(0xffe17055),
  ];

  int key = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      children: <Widget>[
        const Center(
          child: Text(
            'Ingresos vs Gastos',
            style: headingStyle,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width * 0.5,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          centerText: "VS",
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 2,
          ),
        ),
      ],
    );
  }
}
