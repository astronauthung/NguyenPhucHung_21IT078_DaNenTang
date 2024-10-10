import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:midtern_nguyenphuchung/screens/signin_screen.dart';
import 'package:midtern_nguyenphuchung/screens/image_screen.dart';
import 'package:midtern_nguyenphuchung/services/firestore.dart';
import 'package:provider/Provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => StorageService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algicultre App',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInScreen()
    );
  }
}
