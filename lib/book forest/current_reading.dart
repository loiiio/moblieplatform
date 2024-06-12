import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../data/book_data.dart';
import 'total_booklist.dart';

class CurrentReadingPage extends StatefulWidget {
  @override
  _CurrentReadingPageState createState() => _CurrentReadingPageState();
}

class _CurrentReadingPageState extends State<CurrentReadingPage> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  double _currentRating = 3.0;

  void _addBookToIngList(ReadingBook book) {
    setState(() {
      if (ing.indexWhere((element) => element.title == book.title) == -1) {
        ing.add(book);
      }
    });
  }

  void _moveToDone(ReadingBook book, double rating) {
    setState(() {
      ing.remove(book);
      done.add(Book(
        title: book.title,
        author: book.author,
        image: book.image,
        pages: book.pages,
        rating: rating,
      ));
    });
  }

  void _showPagePicker(BuildContext context, ReadingBook book) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: Column(
            children: [
              Text('페이지 선택', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: book.readPages - 1),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      book.readPages = index + 1;
                    });
                  },
                  children: List<Widget>.generate(book.pages, (int index) {
                    return Center(
                      child: Text('${index + 1}'),
                    );
                  }),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('완료'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmationDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showRatingDialog(ReadingBook book) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('별점 주기', style: TextStyle(fontSize: 18)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('별점을 선택하세요 (0.5 단위)', style: TextStyle(fontSize: 15)),
              SizedBox(height: 16),
              RatingBar.builder(
                initialRating: _currentRating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _currentRating = rating;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop(); // 별점 팝업 닫기
                _moveToDone(book, _currentRating);
                _showConfirmationDialog('추가 완료!');
              },
            ),
          ],
        );
      },
    );
  }

  void _showMoveToDoneDialog(ReadingBook book) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('책장에 넣으시겠습니까?', style: TextStyle(fontSize: 14)),
          actions: [
            TextButton(
              child: Text('아니요'),
              onPressed: () {
                setState(() {
                  book.readPages -= 1;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('예'),
              onPressed: () {
                Navigator.of(context).pop(); // 첫 번째 팝업 닫기
                _showRatingDialog(book); // 별점 팝업 표시
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('읽고 있는 책'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: ing.length,
                    itemBuilder: (context, index) {
                      final book = ing[index];
                      final double progress = book.readPages / book.pages * 100;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            book.image,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 16),
                          Text(book.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text(book.author, style: TextStyle(fontSize: 18)),
                          SizedBox(height: 16),
                          Text('${book.readPages}/${book.pages} 페이지'),
                          Text('${progress.toStringAsFixed(0)}% 읽었어요!'),
                          SizedBox(height: 16),
                          if (progress < 100)
                            ElevatedButton(
                              onPressed: () {
                                _showPagePicker(context, book);
                              },
                              child: Text('페이지 수정'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          if (progress == 100)
                            ElevatedButton(
                              onPressed: () {
                                _showMoveToDoneDialog(book);
                              },
                              child: Text('책장에 넣기'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  if (ing.length > 1)
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                      ),
                    ),
                  if (ing.length > 1)
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final selectedBook = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TotalBooklistPage()),
                );
                if (selectedBook != null) {
                  _addBookToIngList(selectedBook);
                }
              },
              child: Text('추가'),
            ),
          ],
        ),
      ),
    );
  }
}
