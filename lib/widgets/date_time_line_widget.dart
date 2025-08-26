import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DateTimeLineWidget extends StatelessWidget {
  final void Function(DateTime)? onDateChange;
  final DateTime? initialDate;

  const DateTimeLineWidget({super.key, this.onDateChange, this.initialDate});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      activeColor: AppColors.primaryPurple,
      initialDate: initialDate ?? DateTime.now(),
      onDateChange:
          onDateChange ??
          (selectedDate) {
            debugPrint("Selected Date: ${selectedDate.toLocal()}");
          },
      headerProps: const EasyHeaderProps(
        monthStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        showSelectedDate: false,
        showMonthPicker: false,
      ),
      dayProps: EasyDayProps(
        width: 50,
        height: 65,
        dayStructure: DayStructure.dayStrDayNum,
        todayStyle: DayStyle(
          borderRadius: 10,
          dayNumStyle: TextStyle(
            color: AppColors.primaryPurple,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          dayStrStyle: TextStyle(color: AppColors.primaryPurple, fontSize: 16),
        ),
        activeDayStyle: const DayStyle(
          borderRadius: 10,
          dayNumStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          dayStrStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        inactiveDayStyle: DayStyle(
          borderRadius: 10,
          dayNumStyle: TextStyle(
            color: AppColors.primaryPurple,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          dayStrStyle: TextStyle(color: AppColors.primaryPurple, fontSize: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryPurple.withValues(alpha: 0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
