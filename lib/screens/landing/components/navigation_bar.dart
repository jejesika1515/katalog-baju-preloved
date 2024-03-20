import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/landing/providers/navigation_bar_provider.dart';
import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:ecommerce/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif/gif.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar>
    with TickerProviderStateMixin {
  late final GifController cartGifController;
  late final GifController searchGifController;
  late final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    cartGifController = GifController(vsync: this);
    searchGifController = GifController(vsync: this);
    _searchFocusNode.addListener(() {
      if (_searchFocusNode.hasFocus) {
        searchGifController.forward();
      } else {
        searchGifController.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tagLineArea(context),
        Divider(
          height: 1.0,
          color: Global().spanishGray.withOpacity(0.3),
        ),
        appBarArea(context),
        Divider(
          height: 1.0,
          color: Global().spanishGray.withOpacity(0.3),
        ),
        const SizedBox(
          height: 20.0,
        ),
        appBarMenu(context),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Consumer<AppNavigationBarProvider> appBarMenu(BuildContext context) {
    return Consumer<AppNavigationBarProvider>(builder: (_, provider, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: Global()
            .menuBar
            .asMap()
            .map(
              (i, e) => MapEntry(
                i,
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onHover: (event) {
                      provider.hoveredMenu = i;
                    },
                    onExit: (event) {
                      provider.hoveredMenu = -1;
                    },
                    child: GestureDetector(
                      onTap: () {
                        // PopupMenu menu = PopupMenu(
                        //   context: context,
                        //   maxColumn: 2,
                        //   items: [
                        //     MenuItem(
                        //       title: 'Lowest\nPrice',
                        //     ),
                        //     MenuItem(
                        //       title: 'Highest\nPrice',
                        //     ),
                        //   ],
                        //   onClickMenu: (MenuItemProvider item) {
                        //     switch (item.menuTitle) {
                        //       case 'Lowest Price':
                        //         // plusFont();
                        //         break;
                        //       case 'Highest Price':
                        //         // minFont();
                        //         break;
                        //       default:
                        //     }
                        //   },
                        //   onDismiss: () {},
                        // );
                        // menu.show(
                        //   rect: const Rect.fromLTRB(1.8, 0.95, 0, 0),
                        //   widgetKey: e['key'],
                        //   dismissable: false,
                        // );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            e['name'],
                            key: e['key'],
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.5,
                              letterSpacing: -0.7,
                              color: provider.hoveredMenu == i
                                  ? Global().salmonPink
                                  : Global().eerieBlack,
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: 2.0,
                            color: provider.hoveredMenu == i
                                ? Global().salmonPink
                                : Global().eerieBlack,
                            width: provider.hoveredMenu == i
                                ? _textSize(
                                    e['name'],
                                    const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5,
                                      letterSpacing: -0.7,
                                    ),
                                  ).width
                                : 0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      );
    });
  }

  Consumer<AppNavigationBarProvider> appBarArea(BuildContext context) {
    return Consumer<AppNavigationBarProvider>(
      builder: (_, provider, __) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width * Global().fixedSidePadding,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Image.asset(
                        'assets/images/logo_tagline.png',
                      ),
                    ),
                    const SizedBox(
                      width: 45.0,
                    )
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    height: 35.0,
                    child: TextField(
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Gif(
                            image: const AssetImage("assets/images/search.gif"),
                            controller: searchGifController,
                            duration: const Duration(seconds: 1),
                            autostart: Autostart.no,
                            height: 30.0,
                            placeholder: (context) => const Text('Loading...'),
                          ),
                          // SvgPicture.asset(
                          //   'assets/images/search.svg',
                          //   height: 10.0,
                          //   colorFilter: ColorFilter.mode(
                          //     Global().sonicSilver,
                          //     BlendMode.srcIn,
                          //   ),
                          // ),
                        ),
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Global().spanishGray,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                        hintText: 'Find your perfect fit, sustainably here ..',
                        contentPadding: const EdgeInsets.only(
                          top: 10.0,
                          left: 15.0,
                          right: 15.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Global().salmonPink,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Global().sonicSilver.withOpacity(0.3),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 45.0,
                    ),
                    // MouseRegion(
                    //   cursor: SystemMouseCursors.click,
                    //   child: SvgPicture.asset(
                    //     'assets/images/shoppingbag.svg',
                    //     height: 35.0,
                    //     colorFilter: ColorFilter.mode(
                    //       Global().sonicSilver,
                    //       BlendMode.srcIn,
                    //     ),
                    //   ),
                    // ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (e) {
                        provider.cartOnHover = true;
                        cartGifController.forward();
                      },
                      onExit: (e) {
                        provider.cartOnHover = false;
                        cartGifController.reset();
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CartScreen(),
                            ),
                          );
                        },
                        child: Gif(
                          image: const AssetImage("assets/images/cart.gif"),
                          controller: cartGifController,
                          duration: const Duration(seconds: 1),
                          autostart: Autostart.no,
                          height: 30.0,
                          placeholder: (context) => const Text('Loading...'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (e) {
                        provider.userOnHover = true;
                      },
                      onExit: (e) {
                        provider.userOnHover = false;
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/images/user.svg',
                          height: 40.0,
                          colorFilter: ColorFilter.mode(
                            provider.userOnHover
                                ? Global().salmonPink
                                : Global().eerieBlack,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget tagLineArea(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: kToolbarHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              MediaQuery.of(context).size.width * Global().fixedSidePadding,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            socialMedia(),
            const MouseRegion(
              cursor: SystemMouseCursors.text,
              child: SelectableText(
                'REVIVE YOUR WARDROBE WITH CURATED  PRELOVED TREASURE, WHERE STYLE MEETS SUSTAINABILITY',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget socialMedia() {
    return Consumer<AppNavigationBarProvider>(
      builder: (_, provider, __) {
        return Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (e) {
                provider.iconInstaOnHover = true;
              },
              onExit: (e) {
                provider.iconInstaOnHover = false;
              },
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300,
                ),
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: provider.iconInstaOnHover
                      ? Global().salmonPink
                      : Global().lowOpacityGray.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () async {
                    html.window
                        .open('https://instagram.com/jesikahrln', 'new tab');
                  },
                  child: SvgPicture.asset(
                    'assets/images/instagram.svg',
                    colorFilter: ColorFilter.mode(
                      provider.iconInstaOnHover
                          ? Global().white
                          : Global().sonicSilver,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (e) {
                provider.iconWaOnHover = true;
              },
              onExit: (e) {
                provider.iconWaOnHover = false;
              },
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300,
                ),
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: provider.iconWaOnHover
                      ? Global().salmonPink
                      : Global().lowOpacityGray.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    html.window.open('https://wa.me/6289636918122', 'new tab');
                  },
                  child: SvgPicture.asset(
                    'assets/images/whatsapp.svg',
                    colorFilter: ColorFilter.mode(
                      provider.iconWaOnHover
                          ? Global().white
                          : Global().sonicSilver,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
