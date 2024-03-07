import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Judul halaman keranjang
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center, // Menyelaraskan elemen secara vertikal
            children: [
              SizedBox(height: 20), // Tambahkan jarak vertikal
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/jejechic_logo.png',
                    height: 70,
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
              SizedBox(height: 20), // Tambahkan jarak verticalkk
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Menempatkan tombol di tengah
                children: [
                  GestureDetector(
                    onTap: () {
                      // Action for Men button
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
                  SizedBox(width: 20), // Tambahkan jarak antara tombol
                  GestureDetector(
                    onTap: () {
                      // Action for Women button
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
              SizedBox(height: 20), // Tambahkan jarak vertikal
              // Tambahkan konten lain di sini, seperti daftar barang belanja
            ],
          ),
        ),
      ),
    );
  }
}
