import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/features/catalog/ui/catalog_page.dart';
import 'package:market/features/fake/ui/fake_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int activeIndex = 0;

  final map = {
    0: const CatalogPage(),
    1: const PromoPage(),
    2: const CartPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: map[activeIndex],
      bottomNavigationBar: CupertinoTabBar(
        height: 48,
        border: const Border(),
        items: const [
          BottomNavigationBarItem(
            label: 'Catalog',
            icon: Icon(CupertinoIcons.at_badge_plus),
          ),
          BottomNavigationBarItem(
            label: 'Promo',
            icon: Icon(CupertinoIcons.asterisk_circle),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(CupertinoIcons.cart),
          ),
        ],
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        currentIndex: activeIndex,
      ),
    );
  }
}
