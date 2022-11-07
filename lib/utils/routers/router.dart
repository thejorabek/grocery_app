import 'package:flutter/material.dart';
import 'package:grocery_app/views/home_screen.dart';
import 'package:grocery_app/views/splash_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      //     case :
      //         final args = settings.arguments as ;
      //         return MaterialPageRoute(
      //             builder: (context) => (
      //             amount: args,
      // ),);
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }

  static const String splash = '/';
  static const String home = '/home';
}
