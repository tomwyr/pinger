import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

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
          Spacer(),
          Container(height: 40.0),
          Image(image: image, width: 144.0, height: 144.0),
          Container(height: 40.0),
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Container(height: 24.0),
          Text(
            description,
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Container(height: 40.0),
          ButtonTheme.fromButtonThemeData(
            data: R.themes.raisedButton,
            child: RaisedButton(
              child: Text(buttonLabel),
              onPressed: onButtonPressed,
            ),
          ),
          Container(height: 40.0),
        ]),
      ),
    );
  }
}
