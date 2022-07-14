import 'package:finish_task_part1/ui/login_screen.dart';
import 'package:finish_task_part1/ui/products_screen.dart';
import 'package:finish_task_part1/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'splash': (context) => const SplashScreen(),
        '/': (context) => const LoginScreen(),
        '/products': (context) => const ProductsScreen(),
      },
      initialRoute: 'splash',
    );
  }
}
