import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Divider(height: 2, thickness: 2),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 115),
                child: CheckboxListTile(
                  title: const Text(
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
              const SizedBox(height: 10),
              const Divider(height: 2, thickness: 2),
              const SizedBox(height: 15),
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
                    const SizedBox(width: 20),
                    Container(
                      width: 170,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFE5325D),
                            Color(0XFF2A2237),
                          ],
                        ),
                      ),
                      child: const Stack(
                        children: [
                          Image(
                            image: AssetImage('assets/images/women-3.png'),
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pure Elegance Blouse',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2237),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 17,
                                  height: 17,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 9),
                                const Text(
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
                          const SizedBox(height: 20),
                          const Column(
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
                        const SizedBox(width: 650),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/svgs/delete.svg',
                            width: 28,
                            height: 28,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2237),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
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
                        const SizedBox(height: 40),
                        const Text(
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
              const SizedBox(height: 10),
              const Divider(height: 2, thickness: 2),
              const SizedBox(height: 15),
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
                    const SizedBox(width: 20),
                    Container(
                      width: 170,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFA395BA),
                            Color(0XFF2A2237),
                          ],
                        ),
                      ),
                      child: const Stack(
                        children: [
                          Image(
                            image: AssetImage('assets/images/men-6.png'),
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Blue Denim Jacket',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2237),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 17,
                                  height: 17,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0XFF253046),
                                  ),
                                ),
                                const SizedBox(width: 9),
                                const Text(
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
                          const SizedBox(height: 20),
                          const Column(
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
                        const SizedBox(width: 680),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/svgs/delete.svg',
                            width: 28,
                            height: 28,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2237),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
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
                        const SizedBox(height: 40),
                        const Text(
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
              const SizedBox(height: 10),
              const Divider(height: 2, thickness: 2),
            ],
          ),
        ),
      ),
    );
  }
}
