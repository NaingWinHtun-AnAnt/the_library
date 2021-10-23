import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/book_option_button_view.dart';

class CarouselItemView extends StatelessWidget {
  final Function(BookVO?) onTapOptionButton;
  final BookVO? book;
  final Key? key;

  CarouselItemView({
    required this.onTapOptionButton,
    required this.book,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        MARGIN_MEDIUM_2,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            CAROUSEL_ITEM_BORDER_RADIUS,
          ),
          boxShadow: [
            BoxShadow(
              color: COLOR_CAROUSEL_BUTTON,
              blurRadius: 4,
              offset: Offset(0, 8),
              spreadRadius: 4,
            ),
          ]),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              book?.bookImage ?? "-",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CarouselOptionButtonView(
              onTapOptionButton: () => onTapOptionButton(book),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CarouselItemButtonView(),
          ),
        ],
      ),
    );
  }
}

class CarouselItemButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        MARGIN_MEDIUM,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              BookOptionButtonView(
                icon: Icons.headset_outlined,
              ),
              Spacer(),
              BookOptionButtonView(
                icon: Icons.download_done_outlined,
              ),
            ],
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          ProgressBarView(),
        ],
      ),
    );
  }
}

class ProgressBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: 0.12,
      color: COLOR_WHITE,
      backgroundColor: COLOR_CAROUSEL_BUTTON,
    );
  }
}

class CarouselOptionButtonView extends StatelessWidget {
  final Function onTapOptionButton;

  CarouselOptionButtonView({
    required this.onTapOptionButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapOptionButton(),
      child: Container(
        margin: EdgeInsets.only(
          top: MARGIN_SMALL,
          right: MARGIN_MEDIUM,
        ),
        child: Icon(
          Icons.more_horiz,
          color: COLOR_WHITE,
        ),
      ),
    );
  }
}
