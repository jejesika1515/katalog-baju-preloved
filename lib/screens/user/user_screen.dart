import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jejechic/screens/login/login_screen.dart';
import 'package:jejechic/screens/basket/basket_screen.dart';
import 'package:jejechic/screens/profile/profile_screen.dart';
import 'package:jejechic/utils/global.dart';

class UserScreen extends StatelessWidget {
  final Global global = Global();

  final List<Map<String, dynamic>> menProducts = [
    {
      'name': 'White Casual Tee',
      'price': 'Rp. 160.000',
      'image': 'assets/images/men-1.png',
    },
    {
      'name': 'Cream Classic Tee',
      'price': 'Rp. 155.000',
      'image': 'assets/images/men-2.png'
    },
    {
      'name': 'Blue Sky Classic Shirt',
      'price': 'Rp. 200.000',
      'image': 'assets/images/men-3.png',
    },
    {
      'name': 'Navy Nightfall Shirt',
      'price': 'Rp. 200.000',
      'image': 'assets/images/men-4.png',
    },
    {
      'name': 'Espresso Brown Jacket',
      'price': 'Rp. 250.000',
      'image': 'assets/images/men-5.png',
    },
    {
      'name': 'Blue Denim Jacket',
      'price': 'Rp. 235.000',
      'image': 'assets/images/men-6.png',
    },
    {
      'name': 'Shadow Black Hoodie',
      'price': 'Rp. 170.000',
      'image': 'assets/images/men-7.png',
    },
    {
      'name': 'Ash Grey Hoodie',
      'price': 'Rp. 175.000',
      'image': 'assets/images/men-8.png',
    },
  ];

  final List<Map<String, dynamic>> womenProducts = [
    {
      'name': 'Midnight Chic Shirt',
      'price': 'Rp. 150.000',
      'image': 'assets/images/women-1.png',
    },
    {
      'name': 'White Whisper Tee',
      'price': 'Rp. 170.000',
      'image': 'assets/images/women-2.png',
    },
    {
      'name': 'Pure Elegance Blouse',
      'price': 'Rp. 200.000',
      'image': 'assets/images/women-3.png',
    },
    {
      'name': 'Ruby Romance Dress',
      'price': 'Rp. 250.000',
      'image': 'assets/images/women-4.png',
    },
    {
      'name': 'Powder Pink Dress',
      'price': 'Rp. 270.000',
      'image': 'assets/images/women-5.png',
    },
    {
      'name': 'Classic Satin Elegance',
      'price': 'Rp. 170.000',
      'image': 'assets/images/women-6.png',
    },
    {
      'name': 'Ocean Mist Shirt',
      'price': 'Rp. 200.000',
      'image': 'assets/images/women-7.png',
    },
    {
      'name': 'Sky Blue Serenity Top',
      'price': 'Rp. 170.000',
      'image': 'assets/images/women-8.png',
    },
  ];

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
                      padding: const EdgeInsets.only(right: 70.0),
                      child: Image.asset(
                        'assets/images/jejechic_logo.png',
                        width: 300,
                        height: 100,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFD9D9D9)),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.all(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search, size: 20, color: Colors.black),
                            SizedBox(width: 5),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:
                                      'Search for your favorite brands, styles, sizes, or colors!',
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
                    padding: const EdgeInsets.only(left: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BasketScreen()),
                        );
                      },
                      child: Image.asset(
                        'assets/images/keranjang.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 120.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/user-plus.svg',
                        width: 26,
                        height: 26,
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
                      onTap: () {},
                      child: Text(
                        'HOME',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "MEN'S",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "WOMEN'S",
                        style: TextStyle(
                          fontSize: 15,
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
                      stops: [0.8, 1.0],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 90, 0, 0),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
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
                            'assets/images/preview-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 115.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Category Choice',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                categoryChips(
                                  images: 'assets/images/image-1.jpg',
                                  name: 'Classic &\nVintage',
                                ),
                                categoryChips(
                                  images: 'assets/images/image-2.jpg',
                                  name: 'Streetwear\nUrban',
                                ),
                                categoryChips(
                                  images: 'assets/images/image-3.jpg',
                                  name: 'Elegant &\nFormal',
                                ),
                                categoryChips(
                                  images: 'assets/images/image-4.jpg',
                                  name: 'Professional\nAttire',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Deal of the Day',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: 290.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5325D),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFE5325D).withOpacity(1.0),
                                  const Color(0xFF2A2237).withOpacity(1.0),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Stack(
                              children: [
                                Image(
                                  image:
                                      AssetImage('assets/images/women-3.png'),
                                  width: 150.0,
                                  height: 250.0,
                                  alignment: Alignment.centerLeft,
                                ),
                                Positioned(
                                  bottom: 160.0,
                                  left: 110.0,
                                  child: Text(
                                    'OFFERS ENDS IN:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: -0.0),
                child: Container(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 115.0),
                          child: TabBar(
                            labelColor: Color(0xFFE5315C),
                            indicatorColor: Color(0xFFE5315C),
                            tabs: [
                              Tab(text: "MEN'S"),
                              Tab(text: "WOMEN'S"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Container(
                            height: 400,
                            child: TabBarView(
                              children: [
                                GridView.count(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  children: List.generate(
                                    menProducts.length,
                                    (index) => ProductItem(
                                      name: menProducts[index]['name'],
                                      price: menProducts[index]['price'],
                                      image: menProducts[index]['image'],
                                      isWomen: false,
                                    ),
                                  ),
                                ),
                                GridView.count(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  children: List.generate(
                                      womenProducts.length,
                                      (index) => ProductItem(
                                            name: womenProducts[index]['name'],
                                            price: womenProducts[index]
                                                ['price'],
                                            image: womenProducts[index]
                                                ['image'],
                                            isWomen: true,
                                          )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 90),
                        Divider(height: 2, thickness: 2),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Follow us on @jejeechic',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Divider(height: 2, thickness: 2),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Copyright © 2024 Jejechic',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Stack categoryChips({
    required String images,
    required String name,
  }) {
    return Stack(
      children: [
        Container(
          width: 180.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                images,
              ),
            ),
          ),
        ),
        Container(
          width: 180.0,
          height: 200.0,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [
                const Color(0xFFE5325D).withOpacity(0.6),
                const Color(0xFF000000).withOpacity(0.0),
              ],
            ),
          ),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final bool isWomen;

  const ProductItem({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.isWomen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 220.0,
          height: 220.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isWomen
                  ? [const Color(0xFFE5315C), const Color(0xFF2A2237)]
                  : [const Color(0xFFA395BA), const Color(0xFF2A2237)],
            ),
          ),
          child: ClipRRect(
            child: Image.asset(
              image,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
