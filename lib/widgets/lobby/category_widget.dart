import 'package:flutter/material.dart';
import 'package:frases_argentinas/global/common/constants.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();

  static final GlobalKey<_CategoryWidgetState> categoryKey =
      GlobalKey<_CategoryWidgetState>();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String? _selectedCategory;
  int? selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Which Category?',
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
            value: _selectedCategory,
            hint: const Text('Category'),
            //isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCategory = newValue;
                selectedCategoryIndex = myCategories.indexOf(newValue!);
              });
            },
            items: List.generate(24, (index) {
              return DropdownMenuItem<String>(
                value: myCategories[index],
                child: Text(
                  myCategories[index],
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
