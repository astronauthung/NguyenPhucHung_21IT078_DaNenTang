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
              reusableTextField("Enter username", Icons.person, false, _emailTextController),
              const SizedBox(
                height: 20, // Adds space after the logo
              ),
              reusableTextField("Enter password", Icons.lock, false, _passwordTextController),
              const SizedBox(
                height: 20, // Adds space after the logo
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
              // Add more widgets here if needed
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

// import 'package:flutter/material.dart';
// import 'package:midtern_nguyenphuchung/reuseable_widgets/reuseable_widget.dart';
// import 'package:midtern_nguyenphuchung/screens/home_screen.dart';
// import 'package:midtern_nguyenphuchung/screens/singup_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';

// // Update this widget to include the new parameters
// Widget reusableTextField(String text, IconData icon, bool isPasswordType,
//     TextEditingController controller, {
//       TextStyle? textStyle,
//       InputDecoration? inputDecoration,
//     }) {
//   return TextField(
//     controller: controller,
//     obscureText: isPasswordType,
//     style: textStyle,
//     decoration: inputDecoration ??
//         InputDecoration(
//           prefixIcon: Icon(icon),
//           labelText: text,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//         ),
//   );
// }


// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final TextEditingController _passwordTextController = TextEditingController();
//   final TextEditingController _emailTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF1E1E1E), Color(0xFF383838)], // Dark gradient background
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
//             crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.2, // Adjust as necessary
//                 ),
//                 child: logoWidget("assets/images/logo.png"),
//               ),
//               const SizedBox(
//                 height: 30, // Adds space after the logo
//               ),
//               // Updated TextField with more modern design
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: reusableTextField(
//                   "Enter Email",
//                   Icons.person_outline,
//                   false,
//                   _emailTextController,
//                   textStyle: const TextStyle(color: Colors.white), // White text
//                   inputDecoration: InputDecoration(
//                     fillColor: Colors.white24,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                       borderSide: BorderSide.none,
//                     ),
//                     hintText: 'Enter email',
//                     hintStyle: const TextStyle(color: Colors.white54),
//                     prefixIcon: const Icon(Icons.person_outline, color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: reusableTextField(
//                   "Enter Password",
//                   Icons.lock_outline,
//                   true,
//                   _passwordTextController,
//                   textStyle: const TextStyle(color: Colors.white),
//                   inputDecoration: InputDecoration(
//                     fillColor: Colors.white24,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                       borderSide: BorderSide.none,
//                     ),
//                     hintText: 'Enter password',
//                     hintStyle: const TextStyle(color: Colors.white54),
//                     prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: signInSignUpButton(context, true, () {
//                   FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                           email: _emailTextController.text,
//                           password: _passwordTextController.text)
//                       .then((value) {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => const HomeScreen()));
//                   }).onError((error, stackTrace) {
//                     print("Error ${error.toString()}");
//                   });
//                 }),
//               ),
//               const SizedBox(height: 15),
//               signUpOption(),
//               const SizedBox(height: 30), // Adjust spacing as necessary
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           "Don't have an account? ",
//           style: TextStyle(color: Colors.white70, fontSize: 16),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const SignUpScreen()));
//           },
//           child: const Text(
//             "Sign Up",
//             style: TextStyle(
//                 color: Colors.lightBlueAccent,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16),
//           ),
//         )
//       ],
//     );
//   }
// }
