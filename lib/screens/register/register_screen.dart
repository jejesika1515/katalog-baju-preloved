import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import untuk menggunakan TapGestureRecognizer
import 'package:jejechic/utils/global.dart';
import 'package:jejechic/screens/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Global().background(context),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Register Text
                Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 20),
                // Please register to make your account Text
                Text(
                  'Please register to make your account',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 20),
                // Rectangle 1
                Container(
                  width: 500,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2A2237), Color(0xFF2A2237)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.39, 0.39],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'No Handphone',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Rectangle 2
                Container(
                  width: 500,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2A2237), Color(0xFF2A2237)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.39, 0.39],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Alamat Email',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Rectangle 3
                Container(
                  width: 500,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2A2237), Color(0xFF2A2237)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.39, 0.39],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Rectangle 4
                Container(
                  width: 500,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2A2237), Color(0xFF2A2237)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.39, 0.39],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Rectangle 5
                Container(
                  width: 500,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF182381),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Already have an account Text
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400, 
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Color(0xFF182381),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigasi ke halaman LoginScreen saat teks "Login" di-klik
                            Navigator.pushNamed(context, '/login');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
