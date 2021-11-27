import 'dart:math';

import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    this.risksOverflow = false,
  }) : super(key: key);

  final double size = 144.0;

  final AssetImage image;
  final String title;
  final String description;
  final bool risksOverflow;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildImage(),
        Container(height: 36.0),
        Text(
          title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(height: 12.0),
        Text(
          description,
          style: const TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildImage() {
    return risksOverflow
        ? Flexible(
            child: LayoutBuilder(
              builder: (_, constraints) => SizedBox(
                height: min(constraints.maxHeight, size),
                width: size,
                child: Image(image: image),
              ),
            ),
          )
        : Image(image: image, width: size, height: size);
  }
}
