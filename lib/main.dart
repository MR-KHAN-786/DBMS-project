import 'package:flutter/material.dart';
import 'package:watch_shopping_app/Authpage/Authpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:watch_shopping_app/SplashScreen/splash_screen.dart';
// Import the generated firebase_options.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      appId: 'Watchstore',
      apiKey: 'AIzaSyCfk7KPphr1fHlicCU7Ch8_DPmSgU_v4wQ',
      projectId: 'watchstore-669ef',
      messagingSenderId: '224008981952',
    ),
  );
  runApp(const MyWatchapp());
}

class MyWatchapp extends StatelessWidget {
  const MyWatchapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Splashscreen(),
      home: Splashscreen(),
    );
  }
}
