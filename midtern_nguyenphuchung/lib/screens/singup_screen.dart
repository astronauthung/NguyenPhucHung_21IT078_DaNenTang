import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:midtern_nguyenphuchung/reuseable_widgets/reuseable_widget.dart';
import 'package:midtern_nguyenphuchung/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 248, 240), 
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2, 
                ),
                child: logoWidget("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 30, 
              ),
              reusableTextField("Enter username", Icons.person, false, _userTextController),
              const SizedBox(
                height: 20, 
              ),
              reusableTextField("Enter email", Icons.email, false, _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter password", Icons.lock, true, _passwordTextController),
              const SizedBox(
                height: 20, 
              ),
              signInSignUpButton(context, false, () {
                FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                  email: _emailTextController.text, 
                  password: _passwordTextController.text)
                .then((value) {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
            ], 
          ),
        ),
      ),
    );
  }
}
