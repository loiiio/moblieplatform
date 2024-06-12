import 'package:flutter/material.dart';
import 'dart:math';
import '../data/book_data.dart';
import '../data/user_data.dart';

class MyStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int pointsRank = 100 - currentUser.points;
    int doneCount = done.length + 1;
    int memoCount = memos.length + 1;

    double total = (doneCount + memoCount).toDouble();
    double doneSize = max((doneCount / total) * 200, 60);
    double memoSize = max((memoCount / total) * 200, 50);
    double pointsSize = max((pointsRank / total) * 30, 50);

    return Scaffold(
      appBar: AppBar(
        //title: Text('나의 독서 통계'),
      ),
      body: Center(
        child: Stack(
          children: [
            _buildBubble(
              context,
              text: 'Tree 상위 ${pointsRank}%',
              size: pointsSize,
              color: Colors.pinkAccent,
              position: 0,
            ),
            _buildBubble(
              context,
              text: 'total read ${doneCount - 1}권의 책을 읽었어요!',
              size: doneSize,
              color: Colors.purple,
              position: 1,
            ),
            _buildBubble(
              context,
              text: '${memoCount - 1}개의 내 생각을 남겼어요!',
              size: memoSize,
              color: Colors.deepPurple,
              position: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBubble(BuildContext context, {required String text, required double size, required Color color, required int position}) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 100;

    double left;
    double top;

    double centerY = height * 0.4;

    if (position % 2 == 0) {
      left = (width / 2) - size - 20;
    } else {
      left = (width / 2) + 20;
    }

    top = centerY + position * (height * 0.1);
    top = top > height - size ? height - size : top;

    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.6),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: size / 8, fontFamily: 'number'),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
