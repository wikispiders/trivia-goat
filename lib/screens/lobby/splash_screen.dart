import 'package:flutter/material.dart';
import 'package:frases_argentinas/widgets/home/loading_widget.dart';

//BORRAR ESTO E INTEGRAR CON EL BACK
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

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
              //     Image.network(
              //   'https://logodix.com/logo/295595.png',
              //   width: 300,
              //   height: 300,
              // ),
            ),
            const SizedBox(height: 100),
            LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
