import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/landing/components/navigation_bar.dart';
import 'package:ecommerce/screens/landing/components/product_item.dart';
import 'package:ecommerce/screens/landing/providers/navigation_bar_provider.dart';
import 'package:ecommerce/utils/global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNavigationBarProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          backgroundColor: Global().cultured,
          body: Scrollbar(
            controller: provider.scrollController,
            child: SingleChildScrollView(
              controller: provider.scrollController,
              child: Column(
                children: [
                  const AppNavigationBar(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            Global().fixedSidePadding,
                      ),
                      child: Container(
                        height: 450.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            colors: [
                              Global().salmonPink,
                              Global().bitterSweet,
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 30.0,
                                  horizontal: 100.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                      'Sustainable\nFashion Finds',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        color: Global().cultured,
                                        fontSize: 42,
                                        height: 1.2,
                                      ),
                                    ),
                                    SelectableText(
                                      'Discover unique, eco-friendly fashion finds at unbeatable prices. Shop our curated collection of preloved clothing and redefine your style sustainably',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Global().cultured,
                                        fontSize: 14,
                                        height: 1.2,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Global().bitterSweet,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        'Shop now',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Global().cultured,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                  child: Image.asset('assets/images/hero.png'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  categoryDOTD(context),
                  const SizedBox(
                    height: 10.0,
                  ),
                  products(context),
                  footer(context)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Padding footer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(context).size.width * Global().fixedSidePadding,
      ),
      child: const Column(
        children: [
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
          SizedBox(height: 10),
        ],
      ),
    );
  }

  SizedBox products(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 1025,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              MediaQuery.of(context).size.width * Global().fixedSidePadding,
        ),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                labelColor: Color(0xFFE5315C),
                tabAlignment: TabAlignment.start,
                indicatorColor: Color(0xFFE5315C),
                labelStyle: TextStyle(
                  color: Color(0xFFE5315C),
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                isScrollable: true,
                tabs: [
                  Tab(text: "MEN'S"),
                  Tab(text: "WOMEN'S"),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    StreamBuilder(
                      stream: Global()
                          .firebase
                          .collection('products')
                          .where('status', isEqualTo: 'active')
                          .where('sex', isEqualTo: 'male')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.hasError) {
                          return Container();
                        }
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 5,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 16,
                          children: List.generate(
                            snapshot.data!.docs.length,
                            (index) => ProductItem(
                              name: snapshot.data!.docs[index].get('name'),
                              price: snapshot.data!.docs[index].get('price'),
                              image: snapshot.data!.docs[index].get('image'),
                              isWomen: false,
                            ),
                          ),
                        );
                      },
                    ),
                    StreamBuilder(
                      stream: Global()
                          .firebase
                          .collection('products')
                          .where('status', isEqualTo: 'active')
                          .where('sex', isEqualTo: 'female')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.hasError) {
                          return Container();
                        }
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 5,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 16,
                          children: List.generate(
                            snapshot.data!.docs.length,
                            (index) => ProductItem(
                              name: snapshot.data!.docs[index].get('name'),
                              price: snapshot.data!.docs[index].get('price'),
                              image: snapshot.data!.docs[index].get('image'),
                              isWomen: false,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding categoryDOTD(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(context).size.width * Global().fixedSidePadding,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  StreamBuilder(
                      stream: Global()
                          .firebase
                          .collection('categories')
                          .where('status', isEqualTo: 'active')
                          .limit(4)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.hasError) {
                          return Container();
                        }
                        if (kDebugMode) {
                          print(snapshot.data!.docs[0].get('image'));
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: snapshot.data!.docs
                              .map<Widget>((QueryDocumentSnapshot doc) {
                            return categoryChips(
                              image: doc.get('image'),
                              name: doc.get('name'),
                            );
                          }).toList(),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(
              width: 50.0,
            ),
            StreamBuilder(
                stream: Global()
                    .firebase
                    .collection('dotds')
                    .where('status', isEqualTo: 'active')
                    .limit(1)
                    .orderBy('promo.endDate', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return Container();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Deal of the Day',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ClipRRect(
                        child: Banner(
                          message:
                              '${snapshot.data!.docs[0].get('promo.discount') * 100}%',
                          location: BannerLocation.topEnd,
                          child: Container(
                            width: 350.0,
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
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    snapshot.data!.docs[0].get('image'),
                                  ),
                                  width: 145.0,
                                  height: 250.0,
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                    right: 5.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'OFFERS ENDS IN:',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      Row(
                                        children: [
                                          countDownDOTD(
                                            time: '1',
                                            desc: 'Days',
                                          ),
                                          const SizedBox(
                                            width: 3.0,
                                          ),
                                          countDownDOTD(
                                            time: '14',
                                            desc: 'Hours',
                                          ),
                                          const SizedBox(
                                            width: 3.0,
                                          ),
                                          countDownDOTD(
                                            time: '56',
                                            desc: 'Min',
                                          ),
                                          const SizedBox(
                                            width: 3.0,
                                          ),
                                          countDownDOTD(
                                            time: '34',
                                            desc: 'Sec',
                                          ),
                                          const SizedBox(
                                            width: 3.0,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Wrap(
                                        direction: Axis.vertical,
                                        spacing: -9.0,
                                        children: [
                                          Text(
                                            'Rp. ${double.tryParse(snapshot.data!.docs[0].get('price')).toString()}',
                                            style: const TextStyle(
                                              decorationColor: Colors.white,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            'Rp. ${(double.tryParse(snapshot.data!.docs[0].get('price'))! - (double.tryParse(snapshot.data!.docs[0].get('price'))! * snapshot.data!.docs[0].get('promo.discount'))).toString()}',
                                            style: const TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Global().bitterSweet,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Buy Now',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Global().cultured,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  Container countDownDOTD({required String time, required String desc}) {
    return Container(
      width: 40.0,
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            desc,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Stack categoryChips({
    required String image,
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
              image: NetworkImage(
                image,
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
