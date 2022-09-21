// ignore_for_file: depend_on_referenced_packages

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:partner_module/e_widget.dart';
import 'package:provider/provider.dart';
import 'package:super_app/dynamin/app_config_store.dart';

class DynamicMiniApp extends StatefulWidget {
  const DynamicMiniApp({Key? key}) : super(key: key);

  @override
  State<DynamicMiniApp> createState() => _DynamicMiniAppState();
}

class _DynamicMiniAppState extends State<DynamicMiniApp> {
  InAppWebViewController? webViewController;

  void setCss(AppConfig config) {
    final color = config.brightness == Brightness.light ? '#e6a756' : '#343a40';
    final background = '.inherited_background {background-color: $color;}';
    webViewController?.injectCSSCode(source: background);
    final button = '.inherited_button_theme {background-color: $color;}';
    webViewController?.injectCSSCode(source: button);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (context) {
        final store = Provider.of<AppConfig>(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  store.brightness == Brightness.light ? 'Light Mode' : 'Dark Mode',
                ),
                Switch.adaptive(
                  value: store.brightness == Brightness.light,
                  onChanged: (val) async {
                    await store.changeMode();
                    setCss(store);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: EpartnerWidget(
                setController: (value) {
                  webViewController = value;
                },
                onLoadStop: () {
                  setCss(store);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
