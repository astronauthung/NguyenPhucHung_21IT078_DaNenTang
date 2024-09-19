import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('images/hung.jpg'),
            ),
            const Text('Senior Intern',
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold ,
                color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Pacifico',),
            ),
            const SizedBox(
              height: 20.0,
              child: Divider(
                color: Color.fromARGB(255, 201, 201, 201),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),

              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child:Row(
                  children: [
                    Icon(Icons.call,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('+84 789 190903',key: Key('phoneNumber'),),
                  ],
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 50.0),

              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.email,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('hungnp.21it@vku.udn.vn'),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Wanna see more?'),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SecondScreen()));
              },),

          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body:Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}