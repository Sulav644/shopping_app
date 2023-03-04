import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils.dart';
import 'package:shopping_app/shopping_app/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const HomePageViewer();
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 1, 20, 36),
        child: Center(
            child: Text(
          'amazon',
          style: style(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
