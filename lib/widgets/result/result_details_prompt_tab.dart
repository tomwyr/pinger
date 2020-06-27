import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/info_section.dart';

class ResultDetailsPromptTab extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onButtonPressed;

  const ResultDetailsPromptTab({
    Key key,
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.buttonLabel,
    @required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(children: <Widget>[
          Expanded(
            child: InfoSection(
              image: image,
              title: title,
              description: description,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: ButtonTheme.fromButtonThemeData(
              data: R.themes.raisedButton,
              child: RaisedButton(
                child: Text(buttonLabel),
                onPressed: onButtonPressed,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
