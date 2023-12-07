import 'package:flutter/material.dart';
//import 'package:frases_argentinas/app_services/app_services.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          // Action for category widget button
        },
        child: Text('Category Widget'),
      ),
    );
  }
}
