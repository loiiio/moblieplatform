import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../data/book_data.dart';
import 'edit_memo.dart';

class ViewMemoPage extends StatelessWidget {
  final Memo memo;

  ViewMemoPage({required this.memo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('메모 보기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.purple.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(memo.book.image, width: 120, height: 180),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          memo.book.title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          memo.book.author,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Card(
                elevation: 4,
                shadowColor: Colors.purple.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(memo.content, style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditMemoPage(memo: memo)),
                    );
                  },
                  child: Text('수정'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffe5ccee),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _shareMemo(memo);
                  },
                  child: Text('공유'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffe5ccee),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareMemo(Memo memo) {
    Share.share('책 제목: ${memo.book.title}\n저자: ${memo.book.author}\n\n메모 내용:\n${memo.content}');
  }
}
