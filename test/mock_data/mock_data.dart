import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/data/vos/book_list_vo.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/buy_link_vo.dart';
import 'package:the_library/data/vos/search_book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';

BookListResultVO getMockBookList() {
  return BookListResultVO(
    publishedDateByAndroid: "2021-05-02",
    lists: [
      BookListVO(
        listId: 704,
        listName: "Combined Print and E-Book Fiction",
        listNameEncoded: "combined-print-and-e-book-fiction",
        displayName: "Combined Print & E-Book Fiction",
        updated: "WEEKLY",
        books: [
          BookVO(
            author: "John Sandford",
            bookImage:
                "https://storage.googleapis.com/du-prd/books/images/9780593087022.jpg",
            contributor: "by John Sandford",
            createdDate: "2021-04-21 22:03:25",
            description:
                "The 31st book in the Prey series. When federal officers are killed, Lucas Davenport and Virgil Flowers team up to investigate matters.",
            title: "OCEAN PREY",
            updatedDate: "2021-04-21 22:07:38",
            buyLinks: [
              BuyLinkVO(
                name: "Amazon",
                url: "https://www.amazon.com/dp/059308702X?tag=NYTBSREV-20",
              ),
              BuyLinkVO(
                name: "Apple Books",
                url:
                    "https://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=OCEAN+PREY&author=John+Sandford",
              ),
            ],
          ),
          BookVO(
            author: "Amanda Gorman",
            bookImage:
                "https://storage.googleapis.com/du-prd/books/images/9780593465271.jpg",
            contributor: "by Amanda Gorman",
            createdDate: "2021-04-21 22:03:25",
            description:
                "The poem read on President Joe Biden's Inauguration Day, by the youngest poet to write and perform an inaugural poem.",
            title: "THE HILL WE CLIMB",
            updatedDate: "2021-04-21 22:07:38",
            buyLinks: [
              BuyLinkVO(
                name: "Amazon",
                url: "https://www.amazon.com/dp/059346527X?tag=NYTBSREV-20",
              ),
              BuyLinkVO(
                name: "Apple Books",
                url:
                    "https://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=THE+HILL+WE+CLIMB&author=Amanda+Gorman",
              ),
            ],
          ),
        ],
      ),
      BookListVO(
        listId: 708,
        listName: "Combined Print and E-Book Nonfiction",
        listNameEncoded: "combined-print-and-e-book-nonfiction",
        displayName: "Combined Print & E-Book Nonfiction",
        updated: "WEEKLY",
        books: [
          BookVO(
            author: "Brandi Carlile",
            bookImage:
                "https://storage.googleapis.com/du-prd/books/images/9780593237243.jpg",
            contributor: "by Brandi Carlile",
            createdDate: "2021-04-21 22:03:26",
            description:
                "The six-time Grammy Award-winning singer and songwriter recounts difficulties during her formative years and her hard-won successes.",
            bookUri: "nyt://book/996cc647-b128-5462-b373-959c7426cde2",
            publisher: "Crown",
            title: "BROKEN HORSES",
            updatedDate: "2021-04-21 22:07:39",
            buyLinks: [
              BuyLinkVO(
                name: "Amazon",
                url: "https://www.amazon.com/dp/0593237242?tag=NYTBSREV-20",
              ),
              BuyLinkVO(
                name: "Apple Books",
                url:
                    "https://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=BROKEN+HORSES&author=Brandi+Carlile",
              ),
            ],
          ),
          BookVO(
            author: "Bessel van der Kolk",
            bookImage:
                "https://storage.googleapis.com/du-prd/books/images/9780670785933.jpg",
            contributor: "by Bessel van der Kolk",
            createdDate: "2021-04-21 22:03:26",
            description:
                "How trauma affects the body and mind, and innovative treatments for recovery.",
            publisher: "Penguin",
            title: "THE BODY KEEPS THE SCORE",
            updatedDate: "2021-04-21 22:07:39",
            buyLinks: [
              BuyLinkVO(
                  name: "Amazon",
                  url:
                      "http://www.amazon.com/The-Body-Keeps-Score-Healing/dp/0670785938?tag=NYTBSREV-20"),
              BuyLinkVO(
                  name: "Apple Books",
                  url:
                      "https://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=THE+BODY+KEEPS+THE+SCORE&author=Bessel+van+der+Kolk"),
            ],
          ),
        ],
      ),
    ],
  );
}

List<BookVO> getMyMockBook() {
  return [
    BookVO(
      author: "John Sandford",
      bookImage:
          "https://storage.googleapis.com/du-prd/books/images/9780593087022.jpg",
      contributor: "by John Sandford",
      createdDate: "2021-04-21 22:03:25",
      description:
          "The 31st book in the Prey series. When federal officers are killed, Lucas Davenport and Virgil Flowers team up to investigate matters.",
      title: "OCEAN PREY",
      updatedDate: "2021-04-21 22:07:38",
      buyLinks: [
        BuyLinkVO(
          name: "Amazon",
          url: "https://www.amazon.com/dp/059308702X?tag=NYTBSREV-20",
        ),
        BuyLinkVO(
          name: "Apple Books",
          url:
              "https://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=OCEAN+PREY&author=John+Sandford",
        ),
      ],
    ),
    BookVO(
      author: "Amanda Gorman",
      bookImage:
          "https://storage.googleapis.com/du-prd/books/images/9780593465271.jpg",
      contributor: "by Amanda Gorman",
      createdDate: "2021-04-21 22:03:25",
      description:
          "The poem read on President Joe Biden's Inauguration Day, by the youngest poet to write and perform an inaugural poem.",
      title: "THE HILL WE CLIMB",
      updatedDate: "2021-04-21 22:07:38",
      buyLinks: [
        BuyLinkVO(
          name: "Amazon",
          url: "https://www.amazon.com/dp/059346527X?tag=NYTBSREV-20",
        ),
        BuyLinkVO(
          name: "Apple Books",
          url:
              "https://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=THE+HILL+WE+CLIMB&author=Amanda+Gorman",
        ),
      ],
    ),
  ];
}

List<SearchBookVO> getMockSearchBook() {
  return [
    SearchBookVO(
      kind: "books#volume",
      id: "upMfAQAAMAAJ",
      eTag: "OAF0Iba9xQ8",
      selfLink: "https://www.googleapis.com/books/v1/volumes/upMfAQAAMAAJ",
    ),
    SearchBookVO(
      kind: "books#volume",
      id: "tvcPogEACAAJ",
      eTag: "YnFib5V2sRg",
      selfLink: "https://www.googleapis.com/books/v1/volumes/tvcPogEACAAJ",
    ),
    SearchBookVO(
      kind: "books#volume",
      id: "LTUeAwAAQBAJ",
      eTag: "ivq7WCNos6Q",
      selfLink: "https://www.googleapis.com/books/v1/volumes/LTUeAwAAQBAJ",
    ),
    SearchBookVO(
      kind: "books#volume",
      id: "lzE-GcsP8kEC",
      eTag: "VA3KUHb2/YM",
      selfLink: "https://www.googleapis.com/books/v1/volumes/lzE-GcsP8kEC",
    ),
  ];
}

List<BookByListNameVO> getMockBookByListName() {
  return [
    BookByListNameVO(
      author: "John Sandford",
      bookImage:
          "https://storage.googleapis.com/du-prd/books/images/9780593465271.jpg",
      title: "OCEAN PREY",
    ),
    BookByListNameVO(
      author: "Amanda Gorman",
      bookImage:
          "https://storage.googleapis.com/du-prd/books/images/9780593087022.jpg",
      title: "THE HILL WE CLIMB",
    ),
  ];
}

List<ShelfVO> getMockShelf() {
  return [
    ShelfVO(
      id: "id-0",
      name: "Recent Book",
      books: getMyMockBook(),
    ),
    ShelfVO(
      id: "id-1",
      name: "Current Book",
      books: getMyMockBook(),
    ),
  ];
}

ShelfVO getShelf() {
  return ShelfVO(
    id: "id",
    name: "Shelf Name",
    books: getMyMockBook(),
  );
}
