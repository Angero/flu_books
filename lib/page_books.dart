part of library_book;

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => new _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  void initState() {
    Storage.initMockData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Books books = Books();
    books.getData(Storage.data);
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Книги'),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.info_outline), onPressed: null),
//        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: books.items.length,
        itemBuilder: (context, index) {
          return _itemBuilder(books.items[index]);
        },
      ),
    );
  }

  Widget _itemBuilder(Book book) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 126.0,
              height: 203.0,
              color: Colors.black12,
              child: Image.network(book.image),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              book.name,
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              book.author,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/book');
      },
    );
  }
}
