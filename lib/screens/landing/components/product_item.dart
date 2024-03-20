import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final num price;
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
        Expanded(
          child: Container(
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
              child: Image.network(
                image,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Rp. ${price.toString()}',
                style: const TextStyle(
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
