import 'package:flutter/material.dart';
import 'package:kidney_savers_app/main.dart';
import 'package:go_router/go_router.dart';
import 'acc_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void  initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      context.go('/accueil_one');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/logo_ks_1.png'),
      ),
    );
  }
}
