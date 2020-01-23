import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_first/language/App_localizations.dart';

class SimpleBarChart extends StatelessWidget {
  final List<AnnualSales> data = [
    AnnualSales(1,'2014', 50),
    AnnualSales(2,'2015', 25),
    AnnualSales(3,'2016', 100),
    AnnualSales(4, '2017', 75),
  ];

  final colors = [
    charts.MaterialPalette.blue.shadeDefault,
    charts.MaterialPalette.red.shadeDefault,
    charts.MaterialPalette.yellow.shadeDefault,
    charts.MaterialPalette.green.shadeDefault,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon : Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(AppLocalizations.of(context).translate("Bar Chart")),
      ),
      body: Container(
        // color: Colors.black,
        height: 400,
        padding: EdgeInsets.all(50),
        child: Stack(
          children: <Widget>[
            Container(
              height: 30,
              child: Center(
                child: Text(
                  AppLocalizations.of(context).translate("Simple Bar Chart") + " ^_^",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: charts.BarChart(
                  [
                    charts.Series<AnnualSales, String>(
                      id: 'Sales',
                      colorFn: (AnnualSales sales, index) => colors[index % 4],
                      domainFn: (AnnualSales sales, _) => sales.year,
                      measureFn: (AnnualSales sales, _) => sales.sales,
                      data: data,
                    )
                  ]
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

/// Sample year data type.
class AnnualSales {
  final int id;
  final String year;
  final int sales;

  AnnualSales(this.id, this.year, this.sales);
}