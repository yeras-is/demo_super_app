import 'dart:math';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:market/features/catalog/ui/store/catalog_store.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final _store = Catalog();

  @override
  void initState() {
    _store.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛞 Düken'),
        bottom: const MarketBottomWidget(),
      ),
      body: Observer(
        builder: (context) => _store.catalog == null
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            '18 июля - 24 июня',
                            '11 июня - 14 июля',
                            '18 марта - 24 марта',
                            '18 августа - 24 августа',
                            '18 августа - 24 августа',
                            '18 августа - 24 августа',
                          ]
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 150,
                                        child: Card(
                                          child: Image.network(
                                            'https://picsum.photos/id/${Random().nextInt(50)}/400/300',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          e,
                                          style: Theme.of(context).textTheme.caption,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 240,
                      child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.horizontal,
                        children: _store.catalog!.products
                            .map(
                              (e) => Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Card(
                                      child: Image.network(
                                        e.images[0],
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    e.title,
                                    style: Theme.of(context).textTheme.caption,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const Divider(),
                    HorizontalCatalog(
                      text: 'Вы недавно смотрели',
                      store: _store,
                    ),
                    const Divider(),
                    HorizontalCatalog(
                      text: 'Вам может понравиться',
                      store: _store,
                    ),
                    const Divider(),
                  ],
                ),
              ),
      ),
    );
  }
}

class MarketBottomWidget extends StatelessWidget implements PreferredSizeWidget {
  const MarketBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          children: const [
            CupertinoTextField(
              placeholder: 'Search',
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              prefixMode: OverlayVisibilityMode.always,
              prefix: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(CupertinoIcons.search),
              ),
            ),
          ],
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(40);
}

class HorizontalCatalog extends StatelessWidget {
  final String text;
  final Catalog store;
  const HorizontalCatalog({Key? key, required this.text, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: theme.textTheme.headline5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: store.catalog!.products
                  .where((element) => Random().nextBool())
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed('./product', arguments: e);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                              width: 130,
                              child: Card(
                                child: Image.network(
                                  e.images[0],
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Text(
                              e.title,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(height: 3),
                            SizedBox(
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${e.price} \$',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                                                '${(e.price * (100 / e.discountPercentage).round())} ₸',
                                                style: theme.textTheme.bodySmall,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' x12',
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
