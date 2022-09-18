import 'package:banking/features/accounts/ui/account_page_details.dart';
import 'package:banking/features/accounts/ui/accounts_page.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  Modular.setInitialRoute('/');
  runApp(ModularApp(module: BankingAppModule(), child: const BankingApp()));
}

class BankingAppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const AccountsPage(),
        ),
        ChildRoute(
          '/details',
          child: (context, args) => const AccountPageDetails(),
        ),
      ];
}

class BankingApp extends StatelessWidget {
  const BankingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: superAppTheme,
    );
  }
}
