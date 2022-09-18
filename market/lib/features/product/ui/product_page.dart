import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/features/catalog/domain/models/catalog_model.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake product page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: Card(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.images.length,
                    itemBuilder: (context, index) => Image.network(
                      product.images[index],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: product.title,
                  style: Theme.of(context).textTheme.headline4,
                  children: [
                    TextSpan(
                      text: product.brand,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Text(
                product.description,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.price} \$',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: ColoredBox(
                              color: theme.colorScheme.inversePrimary,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  '${(product.price * (100 / product.discountPercentage).round())} ₸',
                                  style: theme.textTheme.headline6,
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' x12',
                            style: theme.textTheme.headline6,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: List.generate(
                  product.rating.toInt(),
                  (index) => const Icon(CupertinoIcons.star_fill),
                )..addAll(List.generate(
                    5 - product.rating.toInt(),
                    (index) => const Icon(CupertinoIcons.star),
                  )),
              ),
              const SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.cart),
                    label: const Text('Add to cart'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
