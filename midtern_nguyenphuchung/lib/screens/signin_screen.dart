import 'package:flutter/material.dart';
import 'package:midtern_nguyenphuchung/reuseable_widgets/reuseable_widget.dart';
import 'package:midtern_nguyenphuchung/screens/home_screen.dart';
import 'package:midtern_nguyenphuchung/screens/singup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

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
              reusableTextField("Enter username", Icons.person, false, _emailTextController),
              const SizedBox(
                height: 20, 
              ),
              reusableTextField("Enter password", Icons.lock, true, _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true, () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _emailTextController.text, 
                  password: _passwordTextController.text).then((value) {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
              }),
              signUpOption()
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have account?",
          style: TextStyle(color: Color.fromARGB(179, 0, 0, 0))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Color.fromARGB(255, 1, 99, 66), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

