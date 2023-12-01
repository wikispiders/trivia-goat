import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/provider/username_provider.dart';
import 'package:frases_argentinas/widgets/lobby/join_home.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsernameProvider userNameProvider = Provider.of<UsernameProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            onChanged: userNameProvider.setUsername,
            decoration: InputDecoration(labelText: 'Nombre usuario'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: AppServices().middlewareService.create,
            child: Text('Create'),
          ),
          SizedBox(height: 10),
          JoinHome(),

        ],
      ),
    );
  }
}
