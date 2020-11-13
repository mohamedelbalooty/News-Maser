import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsmaser/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class NewsUrlView extends StatelessWidget {
  final String newsUrl;

  NewsUrlView({@required this.newsUrl});

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KWhiteColor,
          iconTheme: IconThemeData(color: KMainColor),
        ),
        body: WebView(
          initialUrl: newsUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
