part of library_book;

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => new _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final TextEditingController _controllerName = new TextEditingController();
  final TextEditingController _controllerAuthor = new TextEditingController();

  @override
  void initState() {
    _controllerName.text = Books.book.name;
    _controllerAuthor.text = Books.book.author;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Книга'),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.info_outline), onPressed: null),
//        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _controllerName,
              keyboardType: TextInputType.text,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Название',
                hintText: 'Введите название книги',
              ),
            ),
            TextField(
              controller: _controllerAuthor,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Автор',
                hintText: 'Введите имя автора',
              ),
            ),
            SizedBox(height: 40.0,),
            Container(
//              width: 126.0,
              height: 203.0,
//              color: Colors.black12,
              child: Books.book.image == null
                  ? Text('zzz')
                  : Image.network(Books.book.image),
            ),
          ],
        ),
      ),
    );
  }
}
