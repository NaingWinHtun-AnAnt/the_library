import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library/blocs/book_detail_bloc.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/pages/book_list_by_list_name_page.dart';
import 'package:the_library/pages/search_page.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/action_button_view.dart';
import 'package:the_library/widgets/horizontal_book_list_view.dart';
import 'package:the_library/widgets/loading_view.dart';
import 'package:the_library/widgets/similar_book_view.dart';
import 'package:the_library/widgets/title_and_more_button_section_view.dart';

class BookDetailPage extends StatelessWidget {
  final String bookPrimaryIsbn13;

  BookDetailPage({
    required this.bookPrimaryIsbn13,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => BookDetailBloc(bookPrimaryIsbn13),
      child: SafeArea(
        child: Scaffold(
          body: Selector<BookDetailBloc, BookVO?>(
            selector: (BuildContext context, BookDetailBloc bloc) => bloc.book,
            builder: (BuildContext context, book, Widget? child) => book == null
                ? LoadingView()
                : ListView(
                    padding: EdgeInsets.only(
                      bottom: MARGIN_MEDIUM_3,
                    ),
                    children: [
                      AppButtonSectionView(
                        onTapBack: () => Navigator.of(context).pop(),
                        onTapSearch: () => _navigateToSearchPage(context),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_3,
                        ),
                        child: BookImageAndInfoView(
                          book: book,
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_3,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_3,
                        ),
                        child: BookDataView(),
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_3,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_3,
                          ),
                          child: ButtonSectionView(
                            price: book.price,
                          )),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_3,
                        ),
                        child: Divider(
                          color: COLOR_GREY,
                        ),
                      ),
                      // SizedBox(
                      //   height: MARGIN_MEDIUM_2,
                      // ),
                      // Container(
                      //     margin: EdgeInsets.symmetric(
                      //       horizontal: MARGIN_MEDIUM_3,
                      //     ),
                      //     child: BundleSectionView(
                      //       onTapBook: (book) => _navigateToBookDetailPage(context, book),
                      //     )),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      SimilarBookSectionView(
                        onTapBook: () {},
                        onTapMoreButton: () =>
                            _navigateToBookListByListNamePage(context),
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      AboutSectionView(
                        title: "About this ebook",
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      RatingSectionView(),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_3,
                        ),
                        child: ReviewListView(),
                      ),
                      AboutSectionView(
                        title: "About the Author",
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_3,
                        ),
                        child: Divider(
                          color: COLOR_GREY,
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_3,
                        ),
                        child: PolicySectionView(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void _navigateToBookListByListNamePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => BookListByListNamePage(
          listName: "",
          listNameEncoded: "",
        ),
      ),
    );
  }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => SearchPage(),
      ),
    );
  }
}

class ReviewListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Container(
        margin: EdgeInsets.only(
          bottom: MARGIN_MEDIUM_3,
        ),
        child: ReviewView(),
      ),
    );
  }
}

class ReviewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            REVIEW_PROFILE_IMAGE_SIZE / 2,
          ),
          child: Image.network(
            "https://images.unsplash.com/photo-1623091411395-09e79fdbfcf3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
            fit: BoxFit.cover,
            width: REVIEW_PROFILE_IMAGE_SIZE,
            height: REVIEW_PROFILE_IMAGE_SIZE,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Flexible(
          child: ReviewDataSectionView(),
        ),
      ],
    );
  }
}

class ReviewDataSectionView extends StatelessWidget {
  const ReviewDataSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dan Chiccino",
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MARGIN_SMALL,
        ),
        Text("02/01/2015"),
        SizedBox(
          height: MARGIN_SMALL,
        ),
        Text(
          "Created some code to handle disabledText and disabledColor for both FlatButton and RaisedButton with the new TextButton and ElevatedButton widgets.",
          style: TextStyle(
            height: 1.4,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Row(
          children: [
            Text("Was this review helpful?"),
            Spacer(),
            ConfirmButtonView(text: "Yes"),
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            ConfirmButtonView(text: "No"),
          ],
        ),
      ],
    );
  }
}

class ConfirmButtonView extends StatelessWidget {
  final String text;

  ConfirmButtonView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM,
        vertical: MARGIN_SMALL,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: COLOR_GREY,
        ),
      ),
      child: Text(text),
    );
  }
}

class PolicySectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PolicyView(
          icon: Icons.swap_horizontal_circle,
          text: "Google Play refund policy",
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        PolicyView(
          icon: Icons.info_outline,
          text: "All prices include VAT.",
        ),
      ],
    );
  }
}

class PolicyView extends StatelessWidget {
  final IconData icon;
  final String text;

  PolicyView({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class RatingSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndMoreButtonSectionView(
          title: "Ratings and reviews",
          onTapMoreButton: () {},
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_3,
          ),
          child: RatingView(),
        ),
      ],
    );
  }
}

class RatingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "4.4",
          style: TextStyle(
            fontSize: TEXT_BIG,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
      ],
    );
  }
}

class AboutSectionView extends StatelessWidget {
  final String title;

  AboutSectionView({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndMoreButtonSectionView(
          title: title,
          onTapMoreButton: () {},
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_3,
          ),
          child: Text(
            "Travelling near the edge of the brokilon forest, "
            "monster hunter Geralt meets a widowed fisherman who's "
            "dead and murderous wife resides in a eeree mansion known"
            "Travelling near the edge of the brokilon forest, "
            "monster hunter Geralt meets a widowed fisherman who's "
            "dead and murderous wife resides in a eeree mansion known"
            " as the House of Glass, Which seem",
            maxLines: 4,
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              height: 1.4,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class SimilarBookSectionView extends StatelessWidget {
  final Function onTapMoreButton;
  final Function onTapBook;

  SimilarBookSectionView({
    required this.onTapMoreButton,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndMoreButtonSectionView(
          title: "Similar ebooks",
          onTapMoreButton: () => onTapMoreButton(),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        HorizontalSimilarBookListView(
          onTapBook: () => onTapBook(),
        ),
      ],
    );
  }
}

class HorizontalSimilarBookListView extends StatelessWidget {
  final Function onTapBook;

  HorizontalSimilarBookListView({
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HORIZONTAL_SIMILAR_BOOK_LIST_HEIGHT,
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: MARGIN_MEDIUM_3,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: EdgeInsets.only(
            right: MARGIN_MEDIUM_3,
          ),
          child: SimilarBookView(
            onTapBook: () => onTapBook(),
          ),
        ),
      ),
    );
  }
}

class BundleSectionView extends StatelessWidget {
  final Function(BookVO) onTapBook;

  BundleSectionView({
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "3-book bundle",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Text("Frequently bought together"),
              ],
            ),
            Spacer(),
            ActionButtonView(
              text: "Bundle 42.32",
              isGhostButton: true,
              horizontalPadding: MARGIN_MEDIUM_3,
              onTapAction: () {},
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        HorizontalBookListView(
          bookList: [],
          onTapBook: (book) => onTapBook(book),
        ),
      ],
    );
  }
}

class ButtonSectionView extends StatelessWidget {
  final String? price;

  ButtonSectionView({
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionButtonView(
            text: "Free Sample",
            isGhostButton: true,
            onTapAction: () {},
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Expanded(
          child: ActionButtonView(
            text: "${price ?? ""} Buy ",
            textColor: COLOR_GREY_3,
            onTapAction: () {},
          ),
        ),
      ],
    );
  }
}

class BookDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DataView(
          widget: Row(
            children: [
              Text(
                "4.4",
                style: TextStyle(
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MARGIN_SMALL,
              ),
              Icon(
                Icons.star,
              ),
            ],
          ),
          text: "468 reviews",
        ),
        Container(
          width: 2,
          height: 20,
          color: COLOR_GREY,
        ),
        DataView(
          widget: Icon(Icons.book),
          text: "Ebook",
        ),
        Container(
          width: 2,
          height: 20,
          color: COLOR_GREY,
        ),
        DataView(
          widget: Text(
            "120",
            style: TextStyle(
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.bold,
            ),
          ),
          text: "Pages",
        ),
        Container(
          width: 2,
          height: 20,
          color: COLOR_GREY,
        ),
        DataView(
          widget: Icon(
            Icons.comment_outlined,
          ),
          text: "Bubble Zoom",
        ),
        Container(
          width: 2,
          height: 20,
          color: COLOR_GREY,
        ),
        DataView(
          widget: Icon(Icons.book),
          text: "Eligible",
        ),
      ],
    );
  }
}

class DataView extends StatelessWidget {
  final Widget widget;
  final String text;

  DataView({
    required this.widget,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget,
        SizedBox(
          height: MARGIN_SMALL,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}

class BookImageAndInfoView extends StatelessWidget {
  final BookVO book;

  BookImageAndInfoView({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            IMAGE_RADIUS,
          ),
          child: Image.network(
            book.bookImage ?? "-",
            height: BOOK_DETAIL_IMAGE_HEIGHT,
            width: BOOK_DETAIL_IMAGE_WIDTH,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        BookInfoSectionView(
          book: book,
        ),
      ],
    );
  }
}

class BookInfoSectionView extends StatelessWidget {
  final BookVO book;

  BookInfoSectionView({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title ?? "-",
            style: TextStyle(
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          BookInfoTextView(
            text: "Vol 1",
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          BookInfoTextView(
            text: "Paul Tobin",
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          BookInfoTextView(
            text: "Dark Horse Comics",
          ),
        ],
      ),
    );
  }
}

class BookInfoTextView extends StatelessWidget {
  final String text;

  BookInfoTextView({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class AppButtonSectionView extends StatelessWidget {
  final Function onTapBack;
  final Function onTapSearch;

  AppButtonSectionView({
    required this.onTapBack,
    required this.onTapSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Row(
        children: [
          IconView(
            icon: Icons.arrow_back_ios,
            onTapIcon: () => onTapBack(),
            key: Key("BACK"),
          ),
          Spacer(),
          IconView(
            icon: Icons.search,
            onTapIcon: () => onTapSearch(),
          ),
          SizedBox(
            width: MARGIN_MEDIUM_2,
          ),
          IconView(
            icon: Icons.bookmark_added_outlined,
            onTapIcon: () {},
          ),
          SizedBox(
            width: MARGIN_MEDIUM_2,
          ),
          IconView(
            icon: Icons.more_vert_outlined,
            onTapIcon: () {},
          ),
        ],
      ),
    );
  }
}

class IconView extends StatelessWidget {
  final IconData icon;
  final Function onTapIcon;
  final Key? key;

  IconView({
    required this.icon,
    required this.onTapIcon,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapIcon(),
      child: Icon(
        icon,
      ),
    );
  }
}
