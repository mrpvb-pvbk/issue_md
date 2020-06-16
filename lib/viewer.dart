import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class Viewer extends StatelessWidget {
  final String path;
  const Viewer({Key key, this.path}) : super(key: key);

  //Load files from my site
  Future<String> _fututre() async => new HttpClient()
      .getUrl(
          Uri.parse('https://app.coder-side.ru/assets/books/coder_book/$path'))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) =>
          response.transform(new Utf8Decoder()).first);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('$path')),
        body: FutureBuilder(
            future: _fututre(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return LinearProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else
                    return MarkdownWidget(data: snapshot.data); //widget
              }
            }));
  }
}
