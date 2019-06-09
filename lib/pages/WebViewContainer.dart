import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//Webview implementatie
//Manning, N. Flutter webviews
//https://fluttercrashcourse.com/lessons/flutter-webviews
//Geraadpleegd in Mei, 2019

//Deze container wordt zichtbaar wanneer men wenst te surfen naar een website in de app
class WebViewContainer extends StatefulWidget {
  final url;

  const WebViewContainer(this.url);

  @override
  _WebViewContainerState createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();

  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _url,
            ),
          )
        ],
      ),
    );
  }
}
