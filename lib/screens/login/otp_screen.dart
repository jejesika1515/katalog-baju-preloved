import 'package:flutter/material.dart';
import 'package:jejechic/utils/global.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

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
                // Otp Text
                Text(
                  'One Time Password - OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 20),
                // Please input the code that we’ve sent into your mobile phone Text
                Text(
                  "Please input the code that we’ve sent into your mobile phone.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 20),
                // Rectangle 1 with TextField
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
                  child: TextField(
                    style: TextStyle(
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
                      contentPadding: EdgeInsets.only(left: 10.0),
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
                    color: Color(0xFF182381),
                    borderRadius: BorderRadius.circular(10), 
                  ),
                  child: Center(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
