part of library_book;

class Books {
  List<Book> items;
  static Book book;

  Books() {
    items = List();
  }

  getData(String data) {
    Map map = json.decode(data);
    parse(map);
  }

  parse(Map map) {
    for (Map map2 in map['books']) {
      Book book = Book();
      book.parse(map2);
      items.add(book);
    }
  }
}

class Book {
  String name;
  String author;
  String image;

  parse(Map map) {
    name = map['name'];
    author = map['author'];
    image = map['image'];
  }
}
