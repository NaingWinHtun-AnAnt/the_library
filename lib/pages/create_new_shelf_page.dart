import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class CreateNewShelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MARGIN_MEDIUM_2,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2,
              ),
              child: Icon(
                Icons.done,
                color: COLOR_PRIMARY,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2,
              ),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TEXT_HEADING_1X,
                ),
                decoration: InputDecoration(
                  hintText: "Shelf Name",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TEXT_HEADING_1X,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM_2,
            ),
            Divider(
              color: COLOR_GREY,
            ),
          ],
        ),
      ),
    );
  }
}
