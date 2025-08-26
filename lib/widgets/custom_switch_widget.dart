import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class CustomSwitchWidget extends StatefulWidget {
  final double radius;
  final double thumbRadius;
  final Widget? activeChild;
  final Widget? inactiveChild;
  final double width;
  final double height;
  final bool isActive;
  final ValueChanged<bool>? onChanged;

  const CustomSwitchWidget({
    super.key,
    this.radius = 40,
    this.thumbRadius = 100,
    this.activeChild,
    this.inactiveChild,
    this.width = 50,
    this.height = 30,
    this.isActive = false,
    this.onChanged,
  });

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  late final ValueNotifier<bool> _switchController;

  @override
  void initState() {
    super.initState();
    _switchController = ValueNotifier<bool>(widget.isActive);

    // Listen for changes and trigger callback
    _switchController.addListener(() {
      widget.onChanged?.call(_switchController.value);
    });
  }

  @override
  void dispose() {
    _switchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      activeColor: AppColors.primaryPurple,
      inactiveColor: AppColors.neonYellow,
      // activeChild: widget.activeChild ?? const Text('ON'),
      // inactiveChild:
      //     widget.inactiveChild ??
      //     const Text('OFF', style: TextStyle(color: Colors.black)),
      borderRadius: BorderRadius.circular(widget.radius),
      width: widget.width,
      height: widget.height,
      thumb: Container(
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(widget.thumbRadius),
        ),
      ),
      controller: _switchController,
    );
  }
}
