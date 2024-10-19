import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muslems_app/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'مسلمونا',
          style: TextStyle(
              fontFamily: 'ScheherazadeNew',
              fontSize: 100,
              color: Colors.green),
        ),
      ),
    );
  } 
}
/*
 Center(
          child: Image.asset(
        AppAssets.assetsImageAllah,
        fit: BoxFit.fill,
        color: Colors.green,
      )),

      */