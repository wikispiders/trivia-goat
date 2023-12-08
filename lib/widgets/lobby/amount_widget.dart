import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class AmountWidget extends StatefulWidget {
  const AmountWidget({Key? key}) : super(key: key);

  @override
  _AmountWidgetState createState() => _AmountWidgetState();

  static final GlobalKey<_AmountWidgetState> amountKey =
      GlobalKey<_AmountWidgetState>();
}

class _AmountWidgetState extends State<AmountWidget> {
  late int? numberOfQuestions;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        final parsedValue = int.tryParse(value);
        if (parsedValue != null && parsedValue >= 1 && parsedValue <= 50) {
          setState(() {
            numberOfQuestions = parsedValue;
          });
        }
      },
      onSubmitted: (value) {
        final parsedValue = int.tryParse(value);
        if (parsedValue == null || parsedValue < 1 || parsedValue > 50) {
          _controller.clear();
          setState(() {
            numberOfQuestions = null;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please, choose a number between 1 and 50'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Number of Questions',
        hintStyle: TextStyle(fontSize: 14),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
