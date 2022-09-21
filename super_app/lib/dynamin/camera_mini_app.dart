// ignore_for_file: depend_on_referenced_packages

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:partner_module/e_widget.dart';
import 'package:provider/provider.dart';
import 'package:super_app/dynamin/app_config_store.dart';

class CameraMiniApp extends StatefulWidget {
  const CameraMiniApp({Key? key}) : super(key: key);

  @override
  State<CameraMiniApp> createState() => _CameraMiniAppState();
}

class _CameraMiniAppState extends State<CameraMiniApp> {
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: EpartnerWidget(
                url: 'https://kolesa-test.bss.design/photo.html',
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
