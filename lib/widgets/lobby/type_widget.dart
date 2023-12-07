import 'package:flutter/material.dart';
//import 'package:frases_argentinas/app_services/app_services.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 90),
      child: ElevatedButton(
        onPressed: () {
          // Action for type widget button
        },
        child: Text('Type Widget'),
      ),
    );
  }
}
