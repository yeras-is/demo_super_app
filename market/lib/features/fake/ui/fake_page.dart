import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛞 Cart'),
      ),
      body: Center(
          child: Text(
        'Just fake Cart page',
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛞 Promo'),
      ),
      body: Center(
          child: Text(
        'Just fake Promo page',
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
