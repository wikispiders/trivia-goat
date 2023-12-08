import 'package:flutter/material.dart';
import 'package:frases_argentinas/global/common/constants.dart';

class TypeWidget extends StatefulWidget {
  const TypeWidget({Key? key}) : super(key: key);

  @override
  _TypeWidgetState createState() => _TypeWidgetState();

  static final GlobalKey<_TypeWidgetState> typeKey =
      GlobalKey<_TypeWidgetState>();
}

class _TypeWidgetState extends State<TypeWidget> {
  String? _selectedType;
  int? selectedTypeIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Which Type?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 180,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink),
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(50.0),
              right: Radius.circular(50.0),
            ),
            color: const Color.fromARGB(255, 255, 244, 248),
          ),
          alignment: Alignment.center,
          child: DropdownButton<String>(
            value: _selectedType,
            hint: const Text('Type'),
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedType = newValue;
                selectedTypeIndex = myTypes.indexOf(newValue!);
              });
            },
            items: List.generate(2, (index) {
              return DropdownMenuItem<String>(
                value: myTypes[index],
                child: Text(
                  myTypes[index],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 36, 36, 36),
                    fontSize: 12,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
