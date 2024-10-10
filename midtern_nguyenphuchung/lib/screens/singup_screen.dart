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
          color: Color.fromARGB(255, 255, 248, 240), // Updated color to FFF8F1
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2, // Adjust as necessary
                ),
                child: logoWidget("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 30, // Adds space after the logo
              ),
              reusableTextField("Enter username", Icons.person, false, _userTextController),
              const SizedBox(
                height: 20, // Adds space after the logo
              ),
              reusableTextField("Enter email", Icons.email, false, _emailTextController),
              const SizedBox(
                height: 20, // Adds space after the logo
              ),
              reusableTextField("Enter password", Icons.lock, true, _passwordTextController),
              const SizedBox(
                height: 20, // Adds space after the logo
              ),
              signInSignUpButton(context, false, () {
                FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                  email: _emailTextController.text, 
                  password: _passwordTextController.text)
                .then((value) {
                  // print("Create new account);
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
