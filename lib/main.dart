import 'package:flutter/material.dart';
import 'package:test_app/viewer.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      fontFamily: 'Verdana',
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
// i will take data from my site
  Widget openPage(
          String path, String title, BuildContext context) =>
      OutlineButton(
          child: Text(title),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => Viewer(path: path))));

// I didn't understand exactly what the problem was. but I think I can guess it's the file.
// If you copy the text and paste it completely in github editor, the problem will be solved.
// Rather, github removes the wrong symbol that was there.
// I'll leave links from each of the buttons so you can look at the source.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              'This is normal page:'), //https://app.coder-side.ru/assets/books/php/base/57.md
          openPage('php/base/57.md', 'Not broken', context),
          Text('This is broken:'),
          openPage('php/base/54.md', '1',
              context), //https://app.coder-side.ru/assets/books/php/base/54.md
          openPage('php/security/3.md', '2',
              context), //https://app.coder-side.ru/assets/books/php/security/3.md
          openPage('php/security/11.md', '3',
              context), //https://app.coder-side.ru/assets/books/php/security/11.md
        ],
      ),
    );
  }
}
