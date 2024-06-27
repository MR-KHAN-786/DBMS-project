import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Color loginColor = Colors.blueAccent;
Color registerColor = Colors.black;

void getColor(int a) {
  if (a == 1) {
    loginColor = Colors.blueAccent;
  } else {
    loginColor = Colors.black;
  }
  if (a == 2) {
    registerColor = Colors.blueAccent;
  } else {
    registerColor = Colors.black;
  }
}

class _LoginPageState extends State<LoginPage> {
  int flag = 1;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Color loginColor = Colors.blueAccent;
  Color registerColor = Colors.black;

  void getColor(int a) {
    setState(() {
      loginColor = a == 1 ? Colors.blueAccent : Colors.black;
      registerColor = a == 2 ? Colors.blueAccent : Colors.black;
      flag = a;
    });
  }

  Future<void> loginUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.message ?? 'Unknown error occurred', context);
    }
  }

  Future<void> registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context); // Dismiss the loading indicator
      displayMessageToUser("Passwords don't match!", context);
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context); // Dismiss the loading indicator
      displayMessageToUser("User registered successfully!", context);
      clearTextFields();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Dismiss the loading indicator
      displayMessageToUser(e.message ?? 'Unknown error occurred', context);
    } catch (e) {
      Navigator.pop(context); // Dismiss the loading indicator
      displayMessageToUser("Error: $e", context);
    }
  }

  void displayMessageToUser(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Note'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
    userNameController.clear();
    phoneNumberController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: flag == 1
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: 330,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.black,
                            width: double.infinity,
                            height: 350,
                          ),
                          Positioned(
                            top: 135,
                            left: 110,
                            child: Column(
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Please log in to continue.",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      height: 170,
                      width: 330,
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: 'Enter Email',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2)),
                                suffixText: "@gmail.com"),
                            cursorColor: Colors.black,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            obscuringCharacter: '*',
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                            ),
                            cursorColor: Colors.black,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        getColor(1);
                                        flag = 1;
                                      });
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: loginColor),
                                    )),
                                SizedBox(
                                  width: 3,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        getColor(2);
                                        flag = 2;
                                      });
                                    },
                                    child: Text(
                                      "Register",
                                      style: TextStyle(color: registerColor),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                              onPressed: () {
                               passwordController.text = "";
                                emailController.text = "";
                                loginUser();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              child: Text(
                                "Log In ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            )
          : Center(
              child: Container(
                height: double.infinity,
                width: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: Text(
                        "Please create account to continue.",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter User Name',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller:phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Enter Email',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          suffixText: "@gmail.com"),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password ',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  getColor(1);
                                  flag = 1;
                                });
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: loginColor),
                              )),
                          SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  getColor(2);
                                  flag = 2;
                                });
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: registerColor),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          registerUser();
                          passwordController.text = "";
                          emailController.text = "";
                          phoneNumberController.text = "";
                         userNameController.text = "";
                          confirmPasswordController.text = "";
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
