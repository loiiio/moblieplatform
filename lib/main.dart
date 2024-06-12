import 'dart:math';
import 'package:flutter/material.dart';
import 'book forest/profile_edit.dart';
import 'book forest/current_reading.dart';
import 'book forest/my_bookshelf.dart';
import 'book forest/memo/my_notes.dart';
import 'book forest/my_statistics.dart';
import 'book friend/community_page.dart'; // CommunityPage 파일을 임포트합니다
import 'data/book_data.dart'; // Profile 데이터를 임포트합니다
import 'book forest/my tree/my_tree.dart'; // MyTreePage 파일을 임포트합니다
import 'book friend/bookmark_page.dart'; // BookmarkPage 파일을 임포트합니다
import 'data/user_data.dart';
import 'login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: '독서 기록 어플',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Korean',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      home: MyHomePage(toggleTheme: _toggleTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  MyHomePage({required this.toggleTheme});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ReadingBook randomBook;

  @override
  void initState() {
    super.initState();
    randomBook = ing[Random().nextInt(ing.length)];
    currentUser.points = done.length + memos.length; // 포인트 계산
  }

  void _navigateToPage(Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.lightbulb),
                onPressed: widget.toggleTheme,
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Book Forest'),
              onTap: () {
                _navigateToPage(MyHomePage(toggleTheme: widget.toggleTheme));
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Book Friend'),
              onTap: () {
                _navigateToPage(CommunityPage(toggleTheme: widget.toggleTheme));
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Book Mark'),
              onTap: () {
                _navigateToPage(BookmarkPage(toggleTheme: widget.toggleTheme));
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('My Tree'),
              onTap: () {
                _navigateToPage(MyTreePage(toggleTheme: widget.toggleTheme));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('환경설정'),
              onTap: () {
                // 환경설정 기능 추가 가능
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 1. 프로필 섹션
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEditPage()),
                ).then((_) {
                  setState(() {});
                });
              },
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 150.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(currentUser.image),
                      ),
                      SizedBox(height: 16),
                      Text(currentUser.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(currentUser.bio, style: TextStyle(fontSize: 16, color: Colors.grey)),
                      SizedBox(height: 8),
                      Text('포인트: ${currentUser.points}', style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // 2. 읽고 있는 책 섹션
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentReadingPage()),
                );
              },
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        randomBook.image,
                        width: 120,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('읽고 있는 책', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          Text(randomBook.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          Text(randomBook.author, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0),
            // 3. 메뉴 버튼들
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyBookshelfPage()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.library_books),
                            SizedBox(width: 8),
                            Text('나의 책장'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyNotesPage()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.note),
                            SizedBox(width: 8),
                            Text('나의 메모'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyStatisticsPage()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.bar_chart),
                            SizedBox(width: 8),
                            Text('나의 독서'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
