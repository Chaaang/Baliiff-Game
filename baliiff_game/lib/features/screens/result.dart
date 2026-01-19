import 'dart:async';
import 'package:baliiff_game/features/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:baliiff_game/features/utils/language.dart';
import 'package:baliiff_game/features/components/background_wrapper.dart';

class ResultScreen extends StatefulWidget {
  final int correctCount;
  final int totalItems;

  const ResultScreen({
    super.key,
    required this.correctCount,
    required this.totalItems,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start 5-second timer to auto-restart
    _timer = Timer(const Duration(seconds: 5), () {
      _navigateBack();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _navigateBack() {
    if (mounted) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  // Calculate rating based on score percentage
  String _getRating() {
    final percentage = (widget.correctCount / widget.totalItems) * 100;
    if (percentage >= 80) {
      return 'A';
    } else if (percentage >= 60) {
      return 'B';
    } else {
      return 'C';
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = LanguageHelper.currentLanguage;
    final rating = _getRating();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: BackgroundWrapper(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60.0,
                vertical: 100.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Game Over Banner (Hexagonal-like elongated shape)
                  SizedBox(height: 100),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 25,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.orange.shade400,
                          Colors.orange.shade300,
                          Colors.orange.shade400,
                          Colors.orange,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      LanguageHelper.getGameOver(language),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  // Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LanguageHelper.getRating(language),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        rating,
                        style: TextStyle(
                          fontSize: 120,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  // Grade-specific motivational message
                  Column(
                    children: [
                      Text(
                        rating == 'A'
                            ? LanguageHelper.getGradeAMessage1(language)
                            : rating == 'B'
                            ? LanguageHelper.getGradeBMessage1(language)
                            : LanguageHelper.getGradeCMessage1(language),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        rating == 'A'
                            ? LanguageHelper.getGradeAMessage2(language)
                            : rating == 'B'
                            ? LanguageHelper.getGradeBMessage2(language)
                            : LanguageHelper.getGradeCMessage2(language),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Restart button
                  GestureDetector(
                    onTap: () {
                      // Cancel timer and navigate to thank you screen
                      _timer?.cancel();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade900,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            LanguageHelper.getRestart(language),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.blueGrey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
