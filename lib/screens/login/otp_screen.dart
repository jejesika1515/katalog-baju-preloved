import 'package:ecommerce/screens/landing/landing_screen.dart';
import 'package:ecommerce/utils/global.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Global().background(context),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'One Time Password - OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Please input the code that we’ve sent into your mobile phone.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 500,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2A2237), Color(0xFF2A2237)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.39, 0.39],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'xxx-xxx',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                      ),
                      contentPadding: const EdgeInsets.only(left: 10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LandingScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 500,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF182381),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
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
