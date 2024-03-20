import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedFeature = 'My Profile';
  String hoverFeature = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 115.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFE5325D),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/jejechic_logo.png',
                        width: 180,
                        height: 130,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildFeatureRow('assets/svgs/user-2.svg', 'My Profile'),
                    _buildFeatureRow('assets/svgs/shopping.svg', 'My Order'),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Container(
                  width: 500,
                  height: 651,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFE5325D),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      selectedFeature,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String iconAsset, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            hoverFeature = text;
          });
        },
        onExit: (_) {
          setState(() {
            hoverFeature = '';
          });
        },
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedFeature = text;
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(
                iconAsset,
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: hoverFeature == text ? Color(0xFFA395BA) : Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
