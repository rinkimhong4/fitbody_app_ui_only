import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';

class HeightPickerWidget extends StatefulWidget {
  const HeightPickerWidget({super.key});

  @override
  State<HeightPickerWidget> createState() => _HeightPickerWidgetState();
}

class _HeightPickerWidgetState extends State<HeightPickerWidget> {
  int currentHeight = 170;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${currentHeight.toInt()} cm",
          style: GoogleFonts.poppins(fontSize: 52, color: AppColors.neonYellow),
        ),
        SizedBox(height: 10),
        Center(
          child: SizedBox(
            height: 450,
            width: 160,
            child: SimpleRulerPicker(
              axis: Axis.vertical,
              minValue: 0,
              maxValue: 200,
              initialValue: 50,
              onValueChanged: (value) {
                setState(() {
                  currentHeight = value;
                });
              },
              scaleLabelSize: 20,
              scaleBottomPadding: 8,
              scaleItemWidth: 20,
              longLineHeight: 60,
              shortLineHeight: 40,

              lineColor: Colors.white,
              selectedColor: Colors.white,
              labelColor: Colors.white,
              lineStroke: 3,
              height: 200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: BlurredButton(
            label: 'Continue',
            onPressed: () {
              Get.offAndToNamed(AppRoute.setUpGoal);
            },
          ),
        ),
      ],
    );
  }
}
