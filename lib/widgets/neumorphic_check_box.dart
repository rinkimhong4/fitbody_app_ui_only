import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NeumorphicCheckBoxWidget extends StatefulWidget {
  final bool isSelected;
  final ValueChanged<bool>? onChanged;

  const NeumorphicCheckBoxWidget({
    super.key,
    this.isSelected = false,
    this.onChanged,
  });

  @override
  State<NeumorphicCheckBoxWidget> createState() =>
      _NeumorphicCheckBoxWidgetState();
}

class _NeumorphicCheckBoxWidgetState extends State<NeumorphicCheckBoxWidget> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (widget.onChanged != null) widget.onChanged!(isSelected);
      },
      child: SizedBox(
        height: 24,
        width: 24,
        child: Stack(
          alignment: Alignment.center,
          children: [
            NeumorphicCircle(
              innerShadow: true,
              outerShadow: false,
              highlightColor: Colors.white,
              shadowColor: Colors.black87,
              backgroundColor: AppColors.dark,
            ),
            if (isSelected)
              const SizedBox(
                height: 20,
                width: 20,
                child: NeumorphicCircle(
                  innerShadow: false,
                  outerShadow: true,
                  highlightColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  backgroundColor: AppColors.neonYellow,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NeumorphicCircle extends StatelessWidget {
  final bool innerShadow;
  final bool outerShadow;
  final Color highlightColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Widget? child;

  const NeumorphicCircle({
    super.key,
    required this.innerShadow,
    required this.outerShadow,
    required this.highlightColor,
    required this.shadowColor,
    required this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: (outerShadow)
                ? [
                    BoxShadow(
                      color: highlightColor,
                      offset: const Offset(-10, -10),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: shadowColor,
                      offset: const Offset(10, 10),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ]
                : null,
          ),
        ),
        (innerShadow)
            ? ClipPath(
                clipper: HighlightClipper(),
                child: CircleInnerHighlight(
                  highlightColor: highlightColor,
                  backgroundColor: backgroundColor,
                ),
              )
            : const SizedBox.shrink(),
        (innerShadow)
            ? ClipPath(
                clipper: ShadowClipper(),
                child: CircleInnerShadow(
                  shadowColor: shadowColor,
                  backgroundColor: backgroundColor,
                ),
              )
            : const SizedBox.shrink(),
        (child != null) ? child! : const SizedBox.shrink(),
      ],
    );
  }
}

class CircleInnerShadow extends StatelessWidget {
  final Color shadowColor;
  final Color backgroundColor;

  const CircleInnerShadow({
    super.key,
    required this.shadowColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [backgroundColor, shadowColor],
          center: const AlignmentDirectional(0.05, 0.05),
          focal: const AlignmentDirectional(0, 0),
          radius: 0.5,
          focalRadius: 0,
          stops: const [0.75, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0, 0.45],
            colors: [backgroundColor.withValues(alpha: 0), backgroundColor],
          ),
        ),
      ),
    );
  }
}

class CircleInnerHighlight extends StatelessWidget {
  final Color highlightColor;
  final Color backgroundColor;

  const CircleInnerHighlight({
    super.key,
    required this.highlightColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [backgroundColor, highlightColor],
          center: const AlignmentDirectional(-0.05, -0.05),
          focal: const AlignmentDirectional(-0.05, -0.05),
          radius: 0.6,
          focalRadius: 0.1,
          stops: const [0.75, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.55, 1],
            colors: [backgroundColor, backgroundColor.withValues(alpha: 0)],
          ),
        ),
      ),
    );
  }
}

class ShadowClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
}

class HighlightClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }
}
