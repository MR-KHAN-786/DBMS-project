import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:watch_shopping_app/Authpage/Authpage.dart';
import 'package:watch_shopping_app/login%20screen/login_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  late List<AnimationController> _raindropControllers;
  late List<Animation<double>> _raindropAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-0.2, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    _raindropControllers = List.generate(10, (index) {
      return AnimationController(
        duration: Duration(milliseconds: 2000 + index * 200),
        vsync: this,
      )..repeat(reverse: true);
    });

    _raindropAnimations = _raindropControllers.map((controller) {
      return Tween<double>(begin: -100, end: 800).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ));
    }).toList();

    _goHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    for (var controller in _raindropControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  _goHome() async {
    await Future.delayed(
      const Duration(milliseconds: 6000),
      () {},
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>Authpage() ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ..._raindropAnimations.map((animation) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Positioned(
                  top: animation.value,
                  left: (animation.value % MediaQuery.of(context).size.width),
                  child: Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 5,
                  ),
                );
              },
            );
          }).toList(),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        child: Text(
                          "ASHU",
                          style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'Splash',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        child: Text(
                          "Watch Store",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Splash',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(child: Image.asset("images/logo3.png")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
