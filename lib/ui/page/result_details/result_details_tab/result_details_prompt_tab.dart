import 'package:flutter/material.dart';

import 'package:pinger/ui/shared/info_section.dart';

class ResultDetailsPromptTab extends StatelessWidget {
  const ResultDetailsPromptTab({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onButtonPressed,
  }) : super(key: key);

  final AssetImage image;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onButtonPressed;

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
            child: ElevatedButton(
              onPressed: onButtonPressed,
              child: Text(buttonLabel),
            ),
          ),
        ]),
      ),
    );
  }
}
