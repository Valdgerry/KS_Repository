import 'package:flutter/material.dart';
import 'package:kidney_savers_app/splash_screen.dart';
import 'acc_one.dart';
import 'package:go_router/go_router.dart';
import 'package:kidney_savers_app/LoginPages/createAccount.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/accueil_one',
        builder: (context, state) => AccueilOne(),
      ),
      GoRoute(
        path: '/create_account',
        builder: (context, state) => CreateAccount(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Kidney Savers',
      theme: ThemeData(
        fontFamily: 'Poppins', // Police par défaut pour toute l'application
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 18),
          bodySmall: TextStyle(fontSize: 16),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }
}
