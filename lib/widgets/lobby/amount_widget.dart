import 'package:flutter/material.dart';
//import 'package:frases_argentinas/app_services/app_services.dart';

class AmountWidget extends StatefulWidget {
  const AmountWidget({Key? key}) : super(key: key);

  @override
  _AmountWidgetState createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
  int numberOfQuestions = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (numberOfQuestions > 1) {
              setState(() {
                numberOfQuestions--;
              });
            }
          },
          icon: const Icon(Icons.remove),
        ),
        Text(
          '  $numberOfQuestions  ',
          style: const TextStyle(
              fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            if (numberOfQuestions < 50) {
              setState(() {
                numberOfQuestions++;
              });
            }
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}










//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 10),
//       child: ElevatedButton(
//         onPressed: () {
//           // Action for amount widget button
//         },
//         child: Text('Amount Widget'),
//       ),
//     );
//   }
// }