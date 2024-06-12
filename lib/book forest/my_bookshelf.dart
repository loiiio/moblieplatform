import 'package:flutter/material.dart';
import '../data/book_data.dart';

class MyBookshelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('나의 책장'),
      ),
      body: ListView.builder(
        itemCount: done.length,
        itemBuilder: (context, index) {
          final book = done[index];
          return Card(
            child: ListTile(
              leading: Image.asset(book.image, width: 50, height: 70),
              title: Text(book.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.author),
                  SizedBox(height: 4),
                  Text('별점: ${book.rating}', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
