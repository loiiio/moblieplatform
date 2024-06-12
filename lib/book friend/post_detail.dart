import 'package:flutter/material.dart';
import '../data/post_data.dart';
import 'bookmark_page.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;

  PostDetailPage({required this.post});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  bool _isLiked = false;
  bool _isBookmarked = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('게시물 상세 보기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 게시물 블록
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    SizedBox(height: 16),
                    Text(
                      widget.post.content,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    if (widget.post.imagePath != null)
                      Center(
                        child: Image.asset(
                          widget.post.imagePath!,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            _isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                            color: _isLiked ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isLiked = !_isLiked;
                              if (_isLiked) {
                                widget.post.likes++;
                              } else {
                                widget.post.likes--;
                              }
                            });
                          },
                        ),
                        Text('추천 (${widget.post.likes})'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.comment, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('댓글 (${widget.post.comments.length})'),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            _isBookmarked ? Icons.star : Icons.star_border,
                            color: _isBookmarked ? Colors.yellow : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isBookmarked = !_isBookmarked;
                              if (_isBookmarked) {
                                BookmarkPage.bookmarkedPosts.add(widget.post);
                              } else {
                                BookmarkPage.bookmarkedPosts.remove(widget.post);
                              }
                            });
                          },
                        ),
                        Text('즐겨찾기'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // 댓글 블록
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '댓글',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.post.comments.length,
                      itemBuilder: (context, index) {
                        final comment = widget.post.comments[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ),
                          title: Text('User'),
                          subtitle: Text(comment),
                        );
                      },
                    ),
                    TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: '댓글을 입력하세요...',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            if (_commentController.text.isNotEmpty) {
                              setState(() {
                                widget.post.comments.add(_commentController.text);
                                _commentController.clear();
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
