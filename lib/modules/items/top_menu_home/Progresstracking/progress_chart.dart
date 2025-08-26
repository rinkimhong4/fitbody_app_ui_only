import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChart extends StatefulWidget {
  const CartesianChart({super.key});

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  List<_SalesData> data = [
    _SalesData('Jan', 140),
    _SalesData('Feb', 160),
    _SalesData('Mar', 170),
    _SalesData('Apr', 120),
    _SalesData('May', 140),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SfCartesianChart(
        borderWidth: 1,
        borderColor: AppColors.neonYellow,
        primaryYAxis: NumericAxis(
          labelStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
        ),
        primaryXAxis: CategoryAxis(
          labelStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
        ),
        title: ChartTitle(
          text: 'My Progress',
          textStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
        ),
        legend: Legend(
          isVisible: true,
          textStyle: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
        ),
        enableAxisAnimation: true,
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          LineSeries<_SalesData, String>(
            markerSettings: MarkerSettings(
              isVisible: true,
              color: AppColors.white,
            ),
            dataSource: data,
            name: 'January 12th',
            color: AppColors.white,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            // Enable data label
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
