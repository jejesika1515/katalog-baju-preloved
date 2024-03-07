import 'package:flutter/material.dart';
import 'package:jejechic/screens/basket/basket_screen.dart'; // Import file BasketScreen
import 'package:jejechic/screens/home/home_screen.dart'; // Import file HomeScreen
import 'package:jejechic/screens/login/login_screen.dart'; // Import file LoginScreen
import 'package:jejechic/screens/register/register_screen.dart'; // Import file RegisterScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home', // Atur rute awal ke halaman HomeScreen
      routes: {
        '/home': (context) => HomeScreen(), // Atur HomeScreen sebagai halaman awal
        '/login': (context) => LoginScreen(), // Atur LoginScreen sebagai halaman kedua
        '/register': (context) => RegisterScreen(), // Tambahkan rute untuk halaman RegisterScreen
        '/basket': (context) => BasketScreen(), // Tambahkan rute untuk halaman BasketScreen
      },
    );
  }
}
