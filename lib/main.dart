import 'package:flutter/material.dart';
import 'package:jejechic/screens/basket/basket_screen.dart';
import 'package:jejechic/screens/home/home_screen.dart'; 
import 'package:jejechic/screens/login/login_screen.dart';
import 'package:jejechic/screens/login/otp_screen.dart'; 
import 'package:jejechic/screens/profile/profile_screen.dart';
import 'package:jejechic/screens/register/register_screen.dart';
import 'package:jejechic/screens/user/user_screen.dart';
import 'package:jejechic/screens/admin/admin_screen.dart'; 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/otp': (context) => OtpScreen(),
        '/register': (context) => RegisterScreen(),
        '/basket': (context) => BasketScreen(),
        '/user': (context) => UserScreen(),
        '/profile': (context) => ProfileScreen(),
        '/admin': (context) => AdminScreen(),
      },
    );
  }
}
