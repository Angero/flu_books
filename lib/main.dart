import 'package:books/library_book.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books',
      routes: <String, WidgetBuilder>{
        '/books': (BuildContext context) => BooksPage(),
        '/book': (BuildContext context) => BookPage(),
      },
      home: BooksPage(),
    );
  }
}

