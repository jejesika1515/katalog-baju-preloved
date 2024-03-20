import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jejechic/screens/login/login_screen.dart';

class BasketScreen extends StatefulWidget {
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 120),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/images/jejechic_logo.png',
                      height: 100,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  SizedBox(width: 240),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "MEN'S",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 80),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "WOMEN'S",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 300),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/svgs/profil.svg',
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            width: 53,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFF544E5F),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/svgs/keranjang.svg',
                                width: 28,
                                height: 28,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/svgs/whatsapp.svg',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(height: 2, thickness: 2),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 115),
                child: CheckboxListTile(
                  title: Text(
                    'SHOPPING CART',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  value: _isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isChecked = newValue ?? false;
                    });
                  },
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                  tristate: true,
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 2, thickness: 2),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 35,
                      height: 200,
                      child: Checkbox(
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        tristate: true,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 170,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFE5325D),
                            Color(0XFF2A2237),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage('assets/images/women-3.png'),
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pure Elegance Blouse',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Color(0xFF2A2237),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 17,
                                  height: 17,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 9),
                                Text(
                                  'WHITE, M',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp. 199.000 ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                'Rp. 150.000',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 650),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/svgs/delete.svg',
                            width: 28,
                            height: 28,
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFF2A2237),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Only 1 piece',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 2, thickness: 2),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 35,
                      height: 200,
                      child: Checkbox(
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        tristate: true,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 170,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFA395BA),
                            Color(0XFF2A2237),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage('assets/images/men-6.png'),
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Blue Denim Jacket',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Color(0xFF2A2237),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 17,
                                  height: 17,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0XFF253046),
                                  ),
                                ),
                                SizedBox(width: 9),
                                Text(
                                  'BLUE DENIM, M',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp. 235.000',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 680),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/svgs/delete.svg',
                            width: 28,
                            height: 28,
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFF2A2237),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Only 1 piece',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 2, thickness: 2),
            ],
          ),
        ),
      ),
    );
  }
}
