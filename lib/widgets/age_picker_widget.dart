import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AgePickerWidget extends StatefulWidget {
  const AgePickerWidget({super.key});

  @override
  State<AgePickerWidget> createState() => _AgePickerWidgetState();
}

class _AgePickerWidgetState extends State<AgePickerWidget> {
  RulerPickerController? _rulerPickerController;
  num currentAge = 25;

  List<RulerRange> ageRanges = const [RulerRange(begin: 0, end: 101, scale: 1)];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentAge);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Text(
          "$currentAge years old",
          style: GoogleFonts.poppins(fontSize: 52, color: AppColors.neonYellow),
        ),
        Container(
          height: 100,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: RulerPicker(
            rulerBackgroundColor: Colors.transparent,
            controller: _rulerPickerController!,
            onBuildRulerScaleText: (index, value) => value.toInt().toString(),
            rulerScaleTextStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            marker: Container(
              height: 40,
              width: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
            ranges: ageRanges,
            scaleLineStyleList: const [
              ScaleLineStyle(
                color: Colors.grey,
                width: 1,
                height: 30,
                scale: 0,
              ),
              ScaleLineStyle(
                color: Colors.grey,
                width: 1,
                height: 20,
                scale: 5,
              ),
              ScaleLineStyle(
                color: Colors.grey,
                width: 1,
                height: 10,
                scale: -1,
              ),
            ],
            onValueChanged: (value) {
              setState(() {
                currentAge = value.toInt();
              });
            },
            width: MediaQuery.of(context).size.width,
            height: 75,
            rulerMarginTop: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: BlurredButton(
            label: 'Continue',
            onPressed: () {
              Get.offAndToNamed(AppRoute.setUpWeight);
            },
          ),
        ),
      ],
    );
  }
}
