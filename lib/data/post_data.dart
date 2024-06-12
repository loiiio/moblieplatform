class Post {
  final String title;
  final String content;
  final String? imagePath;
  final String author;
  int likes;
  List<String> comments;

  Post({
    required this.title,
    required this.content,
    this.imagePath,
    required this.author,
    this.likes = 0,
    this.comments = const [],
  });
}

List<Post> posts = [

  Post(title: '주식 관련 책 추천해주세요', content: '주식 처음 입문해보려고 하는데 어떤 책으로 시작하는 게 제일 괜찮은가요?', imagePath: 'assets/images/post2.jpg', author: 'User2994'),
  Post(title: '광장 초판 가지고 가지고 있는 사람', content: '문체 많이 달라졌다는데 진짜 그래? 읽어보고 싶은데 빌려볼 수 있는 곳 있나', imagePath: null, author: 'User123', comments: const ['중고 서점 잘 뒤져보면 가끔 나옴']),
  Post(title: '데미안 출판사별 번역 비교', content: '민음사, 문학동네, 을유 문화사, 더 클래식, 그 책 순이고 개인적으로 나는 더 클래식이 제일 취향이었음', imagePath: 'assets/images/post2.jpeg', author: 'User411',
  comments: const['나는 민음사가 젤 취향']),
  Post(title: '부산 독립 서점 어디가 괜찮은가요', content: '여행가는 김에 들리고 싶은데 괜찮은 곳 있을까요?', imagePath: null, author: 'User5123'),
  Post(title: '알베르 카뮈 플로우 차트', content: '카뮈의 플로우 차트는 크게 두 가지인데, 하나는 그냥 집필순(부조리->반항->사랑순)으로 읽는 게 있고'
      ' 다른 하나는 그냥 일반적인 플로우 차트. 집필순으로 읽으려면 카뮈 전집 순서대로 읽으면 됨', imagePath: 'assets/images/post1.jpeg', author: 'User121', likes: 20),
];
