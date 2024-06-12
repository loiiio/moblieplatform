import 'package:flutter/material.dart';
import '../../book friend/bookmark_page.dart';
import '../../book friend/community_page.dart';
import '../../data/user_data.dart';
import '../../main.dart';

class MyTreePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  MyTreePage({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    int level = (currentUser.points ~/ 10);
    String treeImage;

    if (level >= 3) {
      treeImage = 'assets/images/tree3.png';
    } else if (level >= 2) {
      treeImage = 'assets/images/tree2.png';
    } else {
      treeImage = 'assets/images/tree1.png';
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.help_outline),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('도움말'),
                  content: Text('포인트를 모아 나만의 나무를 키워보세요!'),
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
          },
        ),
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
                onPressed: toggleTheme,
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Book Forest'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(toggleTheme: toggleTheme)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Book Friend'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityPage(toggleTheme: toggleTheme)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Book Mark'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BookmarkPage(toggleTheme: toggleTheme)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('My Tree'),
              onTap: () {
                Navigator.pop(context); // 현재 페이지이므로 아무 작업도 하지 않습니다.
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(treeImage, height: 300, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text('${level} 레벨', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
