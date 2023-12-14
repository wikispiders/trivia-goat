import 'package:flutter/material.dart';
import 'package:trivia_goat/screens/lobby/home_screen.dart';
import 'package:trivia_goat/widgets/home/loading_widget.dart';

import '../../app_services/app_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 9), () {
      AppServices().appStateProvider.setScreen(const HomeScreen());
    });

    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Developed by',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Courier',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 60),
            ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/developer_logo.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 100),
            LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
