// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class NewsUrlView extends StatefulWidget {
//   static String id = 'NewsUrlView';
//   final String newsUrl;
//
//   NewsUrlView({@required this.newsUrl});
//
//   @override
//   _NewsUrlViewState createState() => _NewsUrlViewState();
// }
//
// class _NewsUrlViewState extends State<NewsUrlView> {
//   Completer<WebViewController> _controller = Completer<WebViewController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('WebView'),
//       ),
//       body: WebView(
//         initialUrl: widget.newsUrl,
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller.complete(webViewController);
//         },
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsmaser/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

