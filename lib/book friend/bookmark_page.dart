import 'package:book_forest/data/post_data.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'community_page.dart';
import '../book forest/my tree/my_tree.dart';
import 'post_detail.dart';

class BookmarkPage extends StatelessWidget {
  final VoidCallback toggleTheme;

  BookmarkPage({required this.toggleTheme});

  static List<Post> bookmarkedPosts = [];

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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('My Tree'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyTreePage(toggleTheme: toggleTheme)),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('환경설정'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: bookmarkedPosts.length,
        itemBuilder: (context, index) {
          final post = bookmarkedPosts[index];
          return Card(
            child: ListTile(
              title: Text(post.title),
              subtitle: Text(post.content, maxLines: 2, overflow: TextOverflow.ellipsis),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostDetailPage(post: post)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
