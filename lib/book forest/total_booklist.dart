import 'package:flutter/material.dart';
import '../data/book_data.dart';

class TotalBooklistPage extends StatefulWidget {
  @override
  _TotalBooklistPageState createState() => _TotalBooklistPageState();
}

class _TotalBooklistPageState extends State<TotalBooklistPage> {
  void addToReadingList(ReadingBook book) {
    if (ing.indexWhere((element) => element.title == book.title) == -1) {
      setState(() {
        ing.add(book);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Book List'),
      ),
      body: ListView.builder(
        itemCount: total.length,
        itemBuilder: (context, index) {
          final book = total[index];
          return Card(
            child: ListTile(
              leading: Image.asset(book.image, width: 50, height: 70),
              title: Text(book.title),
              subtitle: Text(book.author),
              trailing: ElevatedButton(
                onPressed: () {
                  addToReadingList(book);
                  Navigator.pop(context, book);
                },
                child: Text('선택'),
              ),
            ),
          );
        },
      ),
    );
  }
}
