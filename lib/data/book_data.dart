class Book {
  final String title;
  final String author;
  final String image;
  final int pages;
  double? rating;

  Book({
    required this.title,
    required this.author,
    required this.image,
    required this.pages,
    this.rating,
  });
}

class ReadingBook extends Book {
  int readPages;

  ReadingBook({
    required String title,
    required String author,
    required String image,
    required int pages,
    this.readPages = 0,
  }) : super(title: title, author: author, image: image, pages: pages);
}

List<Book> done = [
  Book(title: '만년', author: '다자이 오사무', image: 'assets/images/com_book1.jpeg', pages: 360, rating: 3.5),
  Book(title: '반항하는 인간', author: '알베르 카뮈', image: 'assets/images/com_book2.jpeg', pages: 640, rating: 4.0),
  Book(title: '오만과 편견', author: '제인 오스틴', image: 'assets/images/com_book3.jpeg', pages: 559, rating: 4.5),
  Book(title: '달과 6펜스', author: '서미싯 몸', image: 'assets/images/com_book4.jpeg', pages: 328, rating: 3.5),
  Book(title: '마사 퀘스트', author: '도리스 레싱', image: 'assets/images/com_book5.jpeg', pages: 480, rating: 3.5),
  Book(title: '삼국유사', author: '일연', image: 'assets/images/com_book6.jpeg', pages: 700, rating: 5.0),
  Book(title: '순수의 시대', author: '이디스 워튼', image: 'assets/images/com_book7.jpeg', pages: 457, rating: 3.5),
  Book(title: '세일즈맨의 죽음', author: '아서 밀러', image: 'assets/images/com_book8.jpeg', pages: 188, rating: 2.5),
  Book(title: '키메라', author: '존바스', image: 'assets/images/com_book9.jpeg', pages: 488, rating: 3.5),
  Book(title: '왕자와 거지', author: '마크 트웨인', image: 'assets/images/com_book10.jpeg', pages: 444, rating: 3.0),

  Book(title: '햄릿', author: '윔리엄 셰익스피어', image: 'assets/images/com_book11.jpeg', pages: 226, rating: 5.0),
  Book(title: '동물농장', author: '조지 오웰', image: 'assets/images/com_book12.jpeg', pages: 160, rating: 5.0),
  Book(title: '허클베리 핀의 모험', author: '마크 트웨인', image: 'assets/images/com_book13.jpeg', pages: 221, rating: 4.0),
  Book(title: '암흑의 핵심', author: '조지프 콘래드', image: 'assets/images/com_book14.jpeg', pages: 200, rating: 3.5),
  Book(title: '파리 대왕', author: '윌리엄 골딩', image: 'assets/images/com_book15.jpeg', pages: 328, rating: 4.5),
  Book(title: '젊은 베르테르의 슬픔', author: '요한 볼프강 폰 괴테', image: 'assets/images/com_book16.jpeg', pages: 244, rating: 5.0),
  Book(title: '다섯째 아이', author: '도리스 레싱', image: 'assets/images/com_book17.jpeg', pages: 191, rating: 3.0),



];

List<Book> bookList = List.from(done);

List<ReadingBook> ing = [
  ReadingBook(
    title: '1984',
    author: '조지오웰',
    image: 'assets/images/now_reading.jpg',
    pages: 444,
    readPages: 440,
  ),
];

List<ReadingBook> total = [
  ReadingBook(title: '마담 보바리', author: '귀스타브 플로베르', image: 'assets/images/com_book18.jpeg', pages: 557),
  ReadingBook(title: '거미여인의 키스', author: '마누엘 푸익', image: 'assets/images/com_book19.jpeg', pages: 300),
  ReadingBook(title: '호밀밭의 파수꾼', author: '제롬 데이비드 샐린저', image: 'assets/images/com_book20.jpeg', pages: 320),
  ReadingBook(title: '데미안', author: '헤르만 헤세', image: 'assets/images/com_book21.jpeg', pages: 239),
  ReadingBook(title: '수레바퀴 아래서', author: '헤르만 헤세', image: 'assets/images/com_book22.jpeg', pages: 278),
  ReadingBook(title: '오셀로', author: '우리리엄 셰익스피어', image: 'assets/images/com_book23.jpeg', pages: 244),
  ReadingBook(title: '설국', author: '가와바타 야스나리', image: 'assets/images/com_book24.jpeg', pages: 163),
  ReadingBook(title: '구운몽', author: '김만중', image: 'assets/images/com_book25.jpeg', pages: 254),

  ReadingBook(title: '만년', author: '다자이 오사무', image: 'assets/images/com_book1.jpeg', pages: 360),
  ReadingBook(title: '반항하는 인간', author: '알베르 카뮈', image: 'assets/images/com_book2.jpeg', pages: 640),
  ReadingBook(title: '오만과 편견', author: '제인 오스틴', image: 'assets/images/com_book3.jpeg', pages: 559),
  ReadingBook(title: '달과 6펜스', author: '서미싯 몸', image: 'assets/images/com_book4.jpeg', pages: 328,),
  ReadingBook(title: '마사 퀘스트', author: '도리스 레싱', image: 'assets/images/com_book5.jpeg', pages: 480),
  ReadingBook(title: '삼국유사', author: '일연', image: 'assets/images/com_book6.jpeg', pages: 700),
  ReadingBook(title: '순수의 시대', author: '이디스 워튼', image: 'assets/images/com_book7.jpeg', pages: 457),
  ReadingBook(title: '세일즈맨의 죽음', author: '아서 밀러', image: 'assets/images/com_book8.jpeg', pages: 188),
  ReadingBook(title: '키메라', author: '존바스', image: 'assets/images/com_book9.jpeg', pages: 488),
  ReadingBook(title: '왕자와 거지', author: '마크 트웨인', image: 'assets/images/com_book10.jpeg', pages: 444),

  ReadingBook(title: '햄릿', author: '윔리엄 셰익스피어', image: 'assets/images/com_book11.jpeg', pages: 226),
  ReadingBook(title: '동물농장', author: '조지 오웰', image: 'assets/images/com_book12.jpeg', pages: 160),
  ReadingBook(title: '허클베리 핀의 모험', author: '마크 트웨인', image: 'assets/images/com_book13.jpeg', pages: 221),
  ReadingBook(title: '암흑의 핵심', author: '조지프 콘래드', image: 'assets/images/com_book14.jpeg', pages: 200),
  ReadingBook(title: '파리 대왕', author: '윌리엄 골딩', image: 'assets/images/com_book15.jpeg', pages: 328),
  ReadingBook(title: '젊은 베르테르의 슬픔', author: '요한 볼프강 폰 괴테', image: 'assets/images/com_book16.jpeg', pages: 244),
  ReadingBook(title: '다섯째 아이', author: '도리스 레싱', image: 'assets/images/com_book17.jpeg', pages: 191),

];




class Memo {
  final Book book;
  String content;

  Memo({required this.book, required this.content});
}

List<Memo> memos = [
  Memo(
    book: Book(title: '오만과 편견', author: '제인 오스틴', image: 'assets/images/com_book3.jpeg', pages: 559, rating: 4.5),
    content: 'p. 31 오만은 내가 보기에는 가장 흔한 결함이야.'
        '오만이란 실제로 아주 일반적이라는 것, 인간 본성은 오만에 기울어지기 쉽다는 것,'
        '실재건 상상이건 자신이 지닌 이런저런 자질에 대해 자만심을 품고 있지 않은 사람은 우리들 가운데 거의 없다는 것이 확실해.'
        '허영과 오만은 종종 동의어로 쓰이긴 하지만 그 뜻이 달라. 허영심이 강하지 않더라도 오만할 수 있지.'
        '오만은 우리 스스로 우리를 어떻게 생각하느냐와 더 관련이 있고, 허영은 다른 사람들이 우리를 어떻게 생각해 주었으면 하는 것과 더 관계되거든.',
  ),
  Memo(
    book: Book(title: '순수의 시대', author: '이디스 워튼', image: 'assets/images/com_book7.jpeg', pages: 457, rating: 3.5),
    content: 'p.439 아들은 섬세하지는 않았지만, 운명을 자신의 주인이 아닌 동등한 상대로 보는 데서 비롯된 여유와 자신감이 있었다.'
        ' 바로 그거야. 저들은 뭐든 충분히 감당할 수 있다고 생각해. 자기들의 길을 알고 있어.',
  ),
  Memo(
    book: Book(title: '파리 대왕', author: '윌리엄 골딩', image: 'assets/images/com_book15.jpeg', pages: 328),
    content: 'p.259 얼굴을 가리는 색칠이 얼마나 사람의 야만성을 풀어놓아 주는 것인가 하는 것을 그들은 속속들이 알고 있었던 것이다.',
  ),
  Memo(
    book: Book(title: '순수의 시대', author: '이디스 워튼', image: 'assets/images/com_book7.jpeg', pages: 457, rating: 3.5),
    content: 'p.248 "도대체 저이들은 내가 무슨 말을 하기를 바라고 있을까요?"',
  ),
];