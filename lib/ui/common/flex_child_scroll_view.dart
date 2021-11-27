import 'package:flutter/material.dart';

class FlexChildScrollView extends StatelessWidget {
  final ScrollController? controller;
  final Widget child;

  const FlexChildScrollView({
    Key? key,
    this.controller,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => SingleChildScrollView(
        controller: controller,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: child,
        ),
      ),
    );
  }
}
