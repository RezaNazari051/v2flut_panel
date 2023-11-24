import 'package:flutter/material.dart';

import 'package:yo_panel/config/theme/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChartWidget extends StatelessWidget {
  const ColumnChartWidget({
    super.key,   required this.itemHeight,
  });

  final double itemHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: itemHeight,
      decoration: BoxDecoration(
        color: AppColor.darkCardBackgroundColor,
        border: Border.all(
          color: AppColor.grayColor,
        ),
        borderRadius: BorderRadius.circular(5),
        
      ),
      child: SfCartesianChart(
        isTransposed: false,

        backgroundColor: AppColor.darkCardBackgroundColor,
        plotAreaBorderWidth: 0,
        title:
            ChartTitle(text: 'نمودار فروش ماهیانه',textStyle: const TextStyle(color: Colors.white)),
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(color: Colors.white),
          rangePadding: ChartRangePadding.round ,
          labelIntersectAction: AxisLabelIntersectAction.rotate45,
          majorGridLines: const MajorGridLines(width: 0),
        ),
        
        primaryYAxis: NumericAxis(
            labelStyle: const TextStyle(color: Colors.white),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0)),
        series: _getDefaultColumnSeries(),
        // tooltipBehavior: _tooltipBehavior,
      ),
    );
  }
}

List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
  return <ColumnSeries<ChartSampleData, String>>[
    ColumnSeries<ChartSampleData, String>(
      dataSource: <ChartSampleData>[
        ChartSampleData(x: 'فروردین', y: 12, pointColor: Colors.red),
        ChartSampleData(x: 'اردیبهشت', y: 20, pointColor: Colors.green),
        ChartSampleData(x: 'خرداد', y: 55, pointColor: Colors.green),
        ChartSampleData(x: 'تیر', y: 14, pointColor: Colors.red),
        ChartSampleData(x: 'مرداد', y: 10, pointColor: Colors.red),
        ChartSampleData(x: 'شهریور', y: 25, pointColor: Colors.green),
        ChartSampleData(x: 'مهر', y: 27, pointColor: Colors.green),
        ChartSampleData(x: 'آبان', y: 19, pointColor: Colors.green),
        ChartSampleData(x: 'آذر', y: 16, pointColor: Colors.green),
        ChartSampleData(x: 'دی', y: 15, pointColor: Colors.red),
        ChartSampleData(x: 'بهمن', y: 10, pointColor: Colors.red),
        ChartSampleData(x: 'اسفند', y: 17, pointColor: Colors.green),
      ],
      trackColor: Colors.blue,
      pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
      borderColor: Colors.amber,
      xValueMapper: (ChartSampleData sales, _) => sales.x as String,
      yValueMapper: (ChartSampleData sales, _) => sales.y,
      borderRadius: BorderRadius.circular(3),
      initialSelectedDataIndexes: [1, 2],
      dataLabelSettings: const DataLabelSettings(
          isVisible: true, textStyle: TextStyle(fontSize: 10,color: Colors.white)),
    )
  ];
}

class ChartSampleData {
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  final dynamic x;

  final num? y;

  final dynamic xValue;

  final num? yValue;

  final num? secondSeriesYValue;

  final num? thirdSeriesYValue;

  final Color? pointColor;

  final num? size;

  final String? text;

  final num? open;

  final num? close;

  final num? low;

  final num? high;

  final num? volume;
}
