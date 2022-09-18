import 'package:flutter/material.dart';
import 'package:market/features/catalog/data/service/catalog_repo_impl.dart';
import 'package:market/features/catalog/domain/services/catalog_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:market/features/product/ui/product_page.dart';
import 'package:market/features/root/ui/root_screen.dart';

void main() {
  Modular.setInitialRoute('/');
  runApp(ModularApp(
    module: MarketAppModule(),
    child: const MarketApp(),
  ));
}

class MarketAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CatalogRepository>(
          (i) => DummyCatalogRepository(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const RootPage(),
        ),
        ChildRoute(
          '/product',
          child: (context, args) => ProductPage(
            product: args.data,
          ),
        ),
      ];
}

class MarketApp extends StatelessWidget {
  const MarketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: superAppTheme,
    );
  }
}
