import 'package:flutter/material.dart';
import '../../data/book_data.dart';
import 'write_memo.dart';
import 'view_memo.dart';

class MyNotesPage extends StatefulWidget {
  @override
  _MyNotesPageState createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  String _searchType = '제목';
  String _searchText = '';
  String _selectedBookSearchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('나의 메모'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddMemoOptions,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: _searchType,
                  items: <String>['제목', '내용'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _searchType = newValue!;
                    });
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '검색',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: memos.length,
              itemBuilder: (context, index) {
                final memo = memos[index];
                if ((_searchType == '제목' && !_containsIgnoreCase(memo.book.title, _searchText)) ||
                    (_searchType == '내용' && !_containsIgnoreCase(memo.content, _searchText))) {
                  return Container();
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewMemoPage(memo: memo)),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(memo.book.image, width: 50, height: 70),
                      title: Text(memo.book.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(memo.book.author),
                          SizedBox(height: 4),
                          Text(memo.content, maxLines: 2, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _containsIgnoreCase(String source, String query) {
    return source.toLowerCase().contains(query.toLowerCase());
  }

  void _showAddMemoOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              title: Text('읽고 있는 책'),
              onTap: () {
                Navigator.pop(context);
                _selectBook(ing);
              },
            ),
            ListTile(
              title: Text('나의 책장'),
              onTap: () {
                Navigator.pop(context);
                _selectBook(done);
              },
            ),
          ],
        );
      },
    );
  }

  void _selectBook(List<Book> bookList) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '검색 (제목 또는 저자)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedBookSearchText = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bookList.length,
                itemBuilder: (context, index) {
                  final book = bookList[index];
                  if (!_containsIgnoreCase(book.title, _selectedBookSearchText) &&
                      !_containsIgnoreCase(book.author, _selectedBookSearchText)) {
                    return Container();
                  }
                  return ListTile(
                    leading: Image.asset(book.image, width: 50, height: 70),
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WriteMemoPage(book: book)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
