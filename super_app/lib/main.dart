import 'package:banking/main.dart' as banking;
import 'package:dependencies/dependencies.dart';
import 'package:dependencies/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/main.dart' as market;
import 'package:partner_module/e_widget.dart';

void main() {
  runApp(ModularApp(
    module: SuperAppModule(),
    child: const SuperAppWidget(),
  ));
}

class SuperAppModule extends Module {
  @override
  List<Module> get imports => [market.MarketAppModule(), banking.BankingAppModule()];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const MyHomePage(title: 'SuperApp')),
        ModuleRoute('/market', module: market.MarketAppModule()),
        ModuleRoute('/banking', module: banking.BankingAppModule()),
      ];
}

class SuperAppWidget extends StatelessWidget {
  const SuperAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: superAppTheme,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          {
            'name': 'Market',
            'onPressed': () {
              Modular.to.pushNamed('/market');
            },
          },
          {
            'name': 'Banking',
            'onPressed': () {
              Modular.to.pushNamed('/banking');
            },
          },
          {
            'name': 'Integration',
            'onPressed': () {
              callModalBottomSheet(
                context,
                const EpartnerWidget(),
              );
            },
          },
        ]
            .map(
              (e) => Card(
                elevation: 3,
                margin: const EdgeInsets.all(30),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: InkWell(
                  onTap: e['onPressed'] as GestureTapCallback,
                  child: Center(
                    child: Text(
                      e['name'].toString(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
