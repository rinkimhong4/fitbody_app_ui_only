import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final Map<String, dynamic> exercise;

  const WorkoutDetailScreen({super.key, required this.exercise});

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  bool _isPlaying = false;
  int _currentStep = 0;
  Duration _remainingTime = Duration.zero;
  late Duration _totalDuration;

  @override
  void initState() {
    super.initState();
    final timeParts = widget.exercise['duration'].split(':');
    final minutes = int.parse(timeParts[0]);
    final seconds = int.parse(timeParts[1]);
    _totalDuration = Duration(minutes: minutes, seconds: seconds);
    _remainingTime = _totalDuration;
  }

  void _toggleTimer() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    // Timer logic would go here in a real implementation
  }

  void _resetTimer() {
    setState(() {
      _isPlaying = false;
      _remainingTime = _totalDuration;
    });
  }

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.exercise['exerciseName'],
          style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Hero Section with Exercise Image
            _buildHeroSection(),
            SizedBox(height: 24),

            // Timer and Controls Section
            _buildTimerSection(),
            SizedBox(height: 32),

            // Exercise Details Section
            _buildDetailsSection(),
            SizedBox(height: 32),

            // Step-by-Step Instructions
            _buildInstructionsSection(),
            SizedBox(height: 32),

            // Navigation Buttons
            _buildNavigationButtons(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Stack(
      children: [
        Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Image.asset(
            widget.exercise['image'],
            height: 280,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.dark.withValues(alpha: 0.9),
                  Colors.transparent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.exercise['exerciseName'],
                          style: AppTextStyles.titleSmall.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.exercise['repetition'],
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.neonYellow,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.fitness_center,
                    color: AppColors.neonYellow,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimerSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryPurple.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryPurple.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            _formatDuration(_remainingTime),
            style: GoogleFonts.poppins(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.neonYellow,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Reset Button
              IconButton(
                icon: Icon(Icons.refresh, color: AppColors.white),
                onPressed: _resetTimer,
                iconSize: 28,
              ),
              SizedBox(width: 20),

              // Play/Pause Button
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryPurple,
                      AppColors.secondaryPurple,
                    ],
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: AppColors.white,
                    size: 32,
                  ),
                  onPressed: _toggleTimer,
                ),
              ),
              SizedBox(width: 20),

              // Skip Button
              IconButton(
                icon: Icon(Icons.skip_next, color: AppColors.white),
                onPressed: () {},
                iconSize: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exercise Details',
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.dark,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildDetailRow(Icons.timer, 'Duration', widget.exercise['duration']),
          SizedBox(height: 12),
          _buildDetailRow(
            Icons.repeat,
            'Repetition',
            widget.exercise['repetition'],
          ),
          SizedBox(height: 12),
          _buildDetailRow(Icons.fitness_center, 'Difficulty', 'Beginner'),
          SizedBox(height: 12),
          _buildDetailRow(
            Icons.local_fire_department,
            'Calories',
            'Approx. 120 kcal',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryPurple, size: 20),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.dark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.primaryPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionsSection() {
    final List<String> steps = [
      'Start in a standing position with feet shoulder-width apart',
      'Hold the dumbbells with palms facing your body',
      'Bend your knees slightly and hinge at the hips',
      'Pull the dumbbells towards your chest, squeezing your back muscles',
      'Slowly lower the dumbbells back to the starting position',
      'Repeat for the specified number of repetitions',
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step-by-Step Instructions',
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.dark,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primaryPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      step,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: _previousStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple.withValues(alpha: 0.2),
                foregroundColor: AppColors.primaryPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text('Previous'),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text('Next Exercise'),
            ),
          ),
        ],
      ),
    );
  }
}
