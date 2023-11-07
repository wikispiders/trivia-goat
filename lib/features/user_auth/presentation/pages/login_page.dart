import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frases_argentinas/features/user_auth/presentation/firebase_auth/firebase_auth_services.dart';
import 'package:frases_argentinas/features/user_auth/presentation/pages/home_page.dart';
import 'package:frases_argentinas/features/user_auth/presentation/pages/signup_page.dart';
import 'package:frases_argentinas/features/user_auth/presentation/widgets/form_container_widget.dart';

import '../../../../global/common/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool _isSigning = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                hintText: "Email",
                isPasswordField: false,
                controller: _emailController
              ),
              SizedBox(height: 10,),
              FormContainerWidget(
                hintText: "Password",
                isPasswordField: true,
                controller: _passwordController
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: _login,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: _isSigning? CircularProgressIndicator(color: Colors.white,) : Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  )
              ),
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignUpPage()), (route) => false);
                    },
                    child: Text("Sign Up", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold))

                  ),
                ],

              ),
            ],
          ),
        ),
      )
    );
  }

  void _login() async {
    setState(() {
      _isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Incorrect email or password");
    }
  }
}