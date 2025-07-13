import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nike_app/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  int logoIndex = 0;

  final String logoNike = 'assets/images/logo_nike.png';
  final String logoJordan = 'assets/images/logo_jordan.png';

  final int numberOfRebounces = 3;

  List<String> get logos {
    List<String> result = [];
    for (int i = 0; i < numberOfRebounces * 2; i++) {
      result.add(i % 2 == 0 ? logoNike : logoJordan);
    }
    return result;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200), // faster bounce
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack, // smoother, less bouncy
    );

    _startBounceSequence();
  }

  Future<void> _startBounceSequence() async {
    final sequence = logos;

    for (int i = 0; i < sequence.length; i++) {
      await _controller.forward();
      await Future.delayed(const Duration(milliseconds: 100));

      await _controller.reverse();
      await Future.delayed(const Duration(milliseconds: 100));

      if (mounted && i + 1 < sequence.length) {
        setState(() {
          logoIndex = i + 1;
        });
      }
    }

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentLogo = logos[logoIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Image.asset(currentLogo, width: 230, height: 230),
        ),
      ),
    );
  }
}