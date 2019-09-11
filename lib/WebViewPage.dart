import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const WebViewPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        leading: Builder(builder: (BuildContext context) {
          return FutureBuilder<WebViewController>(
            future: _controller.future,
            builder: (BuildContext context,
                AsyncSnapshot<WebViewController> snapshot) {
              final WebViewController viewController = snapshot.data;
              return Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      viewController.goBack();
                    },
                  ),
                ],
              );
            },
          );
        }),
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (webController) {
          _controller.complete(webController);
        },
      ),
    );
  }
}
