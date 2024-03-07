import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jejechic/screens/login/login_screen.dart';
import 'package:jejechic/screens/basket/basket_screen.dart'; // Impor BasketScreen

class HomeScreen extends StatelessWidget {
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
                children: [
                  SizedBox(width: 120),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      'assets/svgs/instagram.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      'assets/svgs/whatsapp.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'EXPLORE OUR PRELOVED CLOTHING CATALOG FOR SUSTAINABLE FASHION FINDS!',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(height: 2, thickness: 2),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 110.0), // Padding kiri sebesar 10
                      child: Image.asset(
                        'assets/images/jejechic_logo.png',
                        width: 320,
                        height: 70,
                        alignment: Alignment.centerRight, // Align ke kanan
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFD9D9D9)), // Garis berwarna hitam
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk aksi ketika tombol ditekan
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadowColor: Colors.transparent, // Hapus bayangan tombol
                          elevation: 0, // Hapus kenaikan elevasi tombol
                          padding: EdgeInsets.all(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search, size: 20, color: Colors.black), // Ikon pencarian berwarna hitam
                            SizedBox(width: 5),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for your favorite brands, styles, sizes, or colors!',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF999999),
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0), // Padding kiri sebesar 10
                    child: GestureDetector(
                      onTap: () {
                        // Action for Keranjang
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BasketScreen()), // Arahkan ke BasketScreen
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/keranjang.svg', // Menggunakan SvgPicture.asset untuk logo Keranjang
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 120.0), // Padding kiri sebesar 10
                    child: GestureDetector(
                      onTap: () {
                        // Action for Profil
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/profil.svg', // Menggunakan SvgPicture.asset untuk logo Profil
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(height: 2, thickness: 2),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 400.0),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Action for Home button
                      },
                      child: Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Action for Men's button
                      },
                      child: Text(
                        "Men's",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Action for Women's button
                      },
                      child: Text(
                        "Women's",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: 1100,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Color(0xFFE5315C), Color(0xFF2A2237)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.8, 1.0], // Menentukan di mana warna putih akan berhenti
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 90, 0, 0), // Geser teks ke bawah
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Discover Your Perfect\nPreloved Style',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Browse our curated collection of gently worn clothing\nand find your next favorite piece!',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 146,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2A2237),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // Action when button is pressed
                                  },
                                  child: Text(
                                    'Shop Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50),
                        Container(
                          width: 450,
                          height: 550,
                          child: Image.asset(
                            'assets/images/preview-1.png', // Path to your image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 115.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category Choice',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Text(
                      'Deal of the Day',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
