import 'package:banking/main.dart' as banking;
import 'package:dependencies/dependencies.dart';
import 'package:dependencies/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/main.dart' as market;
import 'package:partner_module/e_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:super_app/features/app_config_store.dart';
import 'package:super_app/features/camera_mini_app.dart';
import 'package:super_app/features/dynamic_mini_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();
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
        ChildRoute('/dynamic', child: (context, args) => const DynamicMiniApp()),
        ChildRoute('/camera', child: (context, args) => const CameraMiniApp()),
        ModuleRoute('/market', module: market.MarketAppModule()),
        ModuleRoute('/banking', module: banking.BankingAppModule()),
      ];
}

class SuperAppWidget extends StatelessWidget {
  const SuperAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    final darkTheme = ThemeData.dark(useMaterial3: true);
    return Provider(
      create: (context) => AppConfig(),
      child: Observer(
        builder: (BuildContext context) => MaterialApp.router(
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          theme: superAppTheme,
          darkTheme: darkTheme.copyWith(
            colorScheme: const ColorScheme.dark(),
            appBarTheme: const AppBarTheme(
              elevation: 1,
              scrolledUnderElevation: 50,
              color: CupertinoColors.darkBackgroundGray,
              centerTitle: true,
            ),
          ),
          themeMode: Provider.of<AppConfig>(context).brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
        ),
      ),
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
            'name': 'Mini App',
            'onPressed': () {
              callModalBottomSheet(
                context,
                const EpartnerWidget(),
              );
            },
          },
          {
            'name': 'Dynamic',
            'onPressed': () {
              Modular.to.pushNamed('/dynamic');
            },
          },
          {
            'name': 'Camera App',
            'onPressed': () {
              Modular.to.pushNamed('/camera');
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
                      style: Theme.of(context).textTheme.headline6,
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
