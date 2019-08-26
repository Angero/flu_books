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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Книга'),
        leading: _backWidget(),
        actions: <Widget>[
          _trashWidget(),
        ],
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
            SizedBox(
              height: 40.0,
            ),
            _imageWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backWidget() {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          if (Books.book.image == null &&
              _controllerName.text == '' &&
              _controllerAuthor.text == '') Navigator.of(context).pop();
          if (_controllerName.text == '') return;
          if (_controllerAuthor.text == '') return;
          Books.book.name = _controllerName.text;
          Books.book.author = _controllerAuthor.text;
          if (Books.book.image == null) {
            Books.book.image = '';
            Books.book.parent.items.add(Books.book);
          }
          Map map = Books.book.parent.toMap();
          Storage.data = json.encode(map);
          Navigator.of(context).pop();
        });
  }

  Widget _trashWidget() {
    if (Books.book.image == null) return Container();
    return IconButton(
        icon: Icon(Icons.delete_outline),
        onPressed: () {
          Books.book.parent.items.remove(Books.book);
          Map map = Books.book.parent.toMap();
          Storage.data = json.encode(map);
          Navigator.of(context).pop();
        });
  }

  Widget _imageWidget() {
    return Container(
      height: 203.0,
      child: (Books.book.image == null || Books.book.image == '')
          ? Text('Нет картинки')
          : Image.network(Books.book.image),
    );
  }
}
