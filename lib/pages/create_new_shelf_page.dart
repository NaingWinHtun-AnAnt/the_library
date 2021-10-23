import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library/blocs/create_new_shelf_bloc.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/widgets/shelf_name_text_field_view.dart';

class CreateNewShelfPage extends StatelessWidget {
  final _mTextController = TextEditingController();
  final _mKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CreateNewShelfBloc(),
      builder: (context, widget) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: _mKey,
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
                    child: GestureDetector(
                      onTap: () => _onCreateNewShelf(context),
                      child: Icon(
                        Icons.done,
                        color: COLOR_PRIMARY,
                        key: Key(CREATE_NEW),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_2,
                    ),
                    child: ShelfNameTextFieldView(
                      textController: _mTextController,
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
          ),
        );
      },
    );
  }

  void _onCreateNewShelf(BuildContext context) {
    final bloc = Provider.of<CreateNewShelfBloc>(context, listen: false);
    if (_mKey.currentState!.validate()) {
      bloc.onCreateNewShelf(_mTextController.text);
      Navigator.of(context).pop();
    }
  }
}
