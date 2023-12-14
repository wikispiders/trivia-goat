import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.33),
      ),
    );
    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.33, 0.66),
      ),
    );
    _animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.66, 1.0),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Loading',
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Courier',
            fontSize: 30,
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Row(
              children: [
                Opacity(
                  opacity: _animation1.value,
                  child: const Text(
                    '.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Courier',
                      fontSize: 40,
                    ),
                  ),
                ),
                Opacity(
                  opacity: _animation2.value,
                  child: const Text(
                    '.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Courier',
                      fontSize: 40,
                    ),
                  ),
                ),
                Opacity(
                  opacity: _animation3.value,
                  child: const Text(
                    '.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Courier',
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
