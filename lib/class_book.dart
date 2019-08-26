part of library_book;

class Books {
  List<Book> items;
  static Book book;

  Books() {
    items = List();
  }

  getData(String data) {
    Map map = json.decode(data);
    fromMap(map);
  }

  fromMap(Map map) {
    for (Map map2 in map['books']) {
      Book book = Book();
      book.fromMap(map2);
      book.parent  = this;
      items.add(book);
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    List list =List();
    for (Book book in items) {
      list.add(book.toMap());
    }
    map['books'] = list;
    return map;
  }
}

class Book {
  String name;
  String author;
  String image;
  Books parent;

  fromMap(Map map) {
    name = map['name'];
    author = map['author'];
    image = map['image'];
  }

  Map<String, String> toMap() {
    Map<String, String> map = Map();
    map['name'] = name;
    map['author'] = author;
    map['image'] = image;
    return map;
  }
}
