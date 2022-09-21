import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EpartnerWidget extends StatelessWidget {
  final ValueSetter<InAppWebViewController>? setController;
  final VoidCallback? onLoadStop;
  final String? url;
  const EpartnerWidget({
    Key? key,
    this.setController,
    this.onLoadStop,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(url ?? 'https://kolesa-test.bss.design')),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          cacheEnabled: false,
          clearCache: true,
          preferredContentMode: UserPreferredContentMode.MOBILE,
        ),
        android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
        ),
        ios: IOSInAppWebViewOptions(),
      ),
      onLoadStop: (_, __) {
        onLoadStop?.call();
      },
      onWebViewCreated: (controller) {
        setController?.call(controller);
        controller.addJavaScriptHandler(
          handlerName: 'getNativeModal',
          callback: (args) {
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => const _Epay(),
            );
          },
        );
      },
    );
  }
}

class _Epay extends StatelessWidget {
  const _Epay();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Native modal title'),
      content: Column(
        children: const [
          Text('Here your Epay transaction starts'),
          Text('Made for Kolesa conf 2022'),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            /// xD выглядит эффектно для презентации
            /// для реальной оплаты лучше использовать https://pub.dev/packages/pay
            Navigator.pop(context);
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  title: const Text('Select payment method'),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Apple Pay'),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
