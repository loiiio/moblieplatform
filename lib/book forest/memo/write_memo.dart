import 'package:flutter/material.dart';
import '../../data/book_data.dart';

class WriteMemoPage extends StatefulWidget {
  final Book book;
  final Memo? existingMemo;

  WriteMemoPage({required this.book, this.existingMemo});

  @override
  _WriteMemoPageState createState() => _WriteMemoPageState();
}

class _WriteMemoPageState extends State<WriteMemoPage> {
  final _memoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingMemo != null) {
      _memoController.text = widget.existingMemo!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingMemo == null ? '메모 작성' : '메모 수정'),
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
                    Image.asset(widget.book.image, width: 120, height: 180),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.book.title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight
                              .bold),
                        ),
                        Text(
                          widget.book.author,
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
                  child: TextField(
                    controller: _memoController,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: '여기에 메모를 작성하세요...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveMemo,
              child: Text('저장'),
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
      ),
    );
  }

  void _saveMemo() {
    final newMemoContent = _memoController.text.trim();
    if (widget.existingMemo != null) {
      setState(() {
        widget.existingMemo!.content = newMemoContent;
      });
    } else {
      final newMemo = Memo(book: widget.book, content: newMemoContent);
      setState(() {
        memos.add(newMemo);
      });
    }
    Navigator.of(context).pop();
  }
}
