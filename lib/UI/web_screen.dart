import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  final String postUrl;
  WebScreen({Key key, @required this.postUrl}) : super(key: key);

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      appBar: AppBar(
        title: Text(
          "Newzity",
          style: TextStyle(
              fontFamily: 'Billabong', fontSize: 35.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFEDF0F6),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.postUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
