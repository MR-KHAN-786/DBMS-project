import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Color LoginColor = Colors.blueAccent;
Color RegisterColor = Colors.black;

GetColor(int a) {
  if (a == 1) {
    LoginColor = Colors.blueAccent;
  } else {
    LoginColor = Colors.black;
  }
  if (a == 2) {
    RegisterColor = Colors.blueAccent;
  } else {
    RegisterColor = Colors.black;
  }
}

class _LoginPageState extends State<LoginPage> {
  int flag = 1;
  var EmailText = TextEditingController();
  var PassText = TextEditingController();
  var UserName = TextEditingController();
  var PhoneNumber = TextEditingController();

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
                                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                SizedBox(height: 5,),
                                Text("Please log in to continue.", style: TextStyle(color: Colors.white70,fontSize: 15, ),),

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
                          controller: EmailText,
                          decoration: InputDecoration(
                              hintText: 'Enter Email',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: Colors.blue, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
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
                            controller: PassText,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: Colors.blue, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: Colors.black, width: 2)),
                            ),
                            cursorColor: Colors.black,
                          ),
                      SizedBox(
                        height: 7,),

                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          GetColor(1);
                                          flag = 1;
                                        });
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(color: LoginColor),
                                      )),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          GetColor(2);
                                          flag = 2;
                                        });
                                      },
                                      child: Text(
                                        "Register",
                                        style: TextStyle(color: RegisterColor),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black
                              ),
                              child: Text(
                                "Submit",
                                style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),
                              )
                          ),

                        ],
                      ),

                    ),
                  ),

                  SizedBox(height: 60,)
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
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 90),
                child: Text("Please create account to continue.", style: TextStyle(color: Colors.black54,fontSize: 14),),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: UserName,
                decoration: InputDecoration(
                  hintText: 'Enter User Name',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                cursorColor: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: PhoneNumber,
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                cursorColor: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: EmailText,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
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
                controller: PassText,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                cursorColor: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              GetColor(1);
                              flag = 1;
                            });
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: LoginColor),
                          )),
                      SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              GetColor(2);
                              flag = 2;
                            });
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: RegisterColor),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                  ),
                  child: Text(
                    "Submit",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
