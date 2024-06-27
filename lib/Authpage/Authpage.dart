import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watch_shopping_app/HomeScreen/home_screen.dart';
import 'package:watch_shopping_app/login%20screen/login_page.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
builder: (context, snapshot){

if(snapshot.hasData){
  return Home_screen();
}
else{
  return  LoginPage();
}
} ),
);


   
  }
}