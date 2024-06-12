import 'package:flutter/material.dart';
import 'my_notes.dart';
import '../../data/book_data.dart';

class EditMemoPage extends StatefulWidget {
  final Memo memo;

  EditMemoPage({required this.memo});

  @override
  _EditMemoPageState createState() => _EditMemoPageState();
}

class _EditMemoPageState extends State<EditMemoPage> {
  final _memoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _memoController.text = widget.memo.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('메모 수정'),
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
                    Image.asset(widget.memo.book.image, width: 120, height: 180),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.memo.book.title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.memo.book.author,
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
                      hintText: '여기에 메모를 수정하세요...',
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
    setState(() {
      widget.memo.content = _memoController.text.trim();
    });
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => MyNotesPage()),
          (Route<dynamic> route) => false,
    );
  }
}
