import 'package:flutter/material.dart';
import '../main.dart';
import '../data/post_data.dart';
import 'post_detail.dart';
import 'bookmark_page.dart';
import '../book forest/my tree/my_tree.dart';

class CommunityPage extends StatelessWidget {
  final VoidCallback toggleTheme;

  CommunityPage({required this.toggleTheme});

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    posts.sort((a, b) => b.likes.compareTo(a.likes));

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
                _navigateToPage(context, MyHomePage(toggleTheme: toggleTheme));
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Book Friend'),
              onTap: () {
                _navigateToPage(context, CommunityPage(toggleTheme: toggleTheme));
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Book Mark'),
              onTap: () {
                _navigateToPage(context, BookmarkPage(toggleTheme: toggleTheme));
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('My Tree'),
              onTap: () {
                _navigateToPage(context, MyTreePage(toggleTheme: toggleTheme));
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (posts.isNotEmpty)
            Card(
              color: Colors.purple[100],
              elevation: 4,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'BEST',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      posts[0].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts[0].content,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text('작성자: ${posts[0].author}'),
                        SizedBox(height: 4),
                        Text('추천: ${posts[0].likes}  댓글: ${posts[0].comments.length}'),
                      ],
                    ),
                    trailing: posts[0].imagePath != null
                        ? Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(posts[0].imagePath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : null,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostDetailPage(post: posts[0])),
                      );
                    },
                  ),
                ],
              ),
            ),
          ...posts.map((post) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  post.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text('작성자: ${post.author}'),
                    SizedBox(height: 4),
                    Text('추천: ${post.likes}  댓글: ${post.comments.length}'),
                  ],
                ),
                trailing: post.imagePath != null
                    ? Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(post.imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : null,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostDetailPage(post: post)),
                  );
                },
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
