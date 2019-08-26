part of library_book;

class Storage {
  static String data;

  static initMockData() {
    Map<String, dynamic> map = Map();
    List<Map> list = List();
    list.add(initMockDataItem('Мастер и Маргарита', 'Булгаков',
        'https://r5.readrate.com/img/pictures/book/261/261983/261983/w136h203-72d701af.jpg'));
    list.add(initMockDataItem('Евгений Онегин', 'Пушкин',
        'https://r2.readrate.com/img/pictures/book/322/322200/322200/w136h203-790df161.jpg'));
    list.add(initMockDataItem('Преступление и наказание', 'Достоевский',
        'https://r2.readrate.com/img/pictures/book/239/239046/239046/w136h203-461a7a0b.jpg'));
    list.add(initMockDataItem('Война и мир', 'Толстой',
        'https://r2.readrate.com/img/pictures/book/272/272000/272000/w136h203-acf50da0.jpg'));
    list.add(initMockDataItem('Герой нашего времени', 'Лермонтов',
        'https://r5.readrate.com/img/pictures/book/304/304629/304629/w136h203-57f2e046.jpg'));
    map['books'] = list;
    data = json.encode(map);
  }

  static Map initMockDataItem(String name, String author, String image) {
    Map<String, String> map = Map();
    map['name'] = name;
    map['author'] = author;
    map['image'] = image;
    return map;
  }
}
