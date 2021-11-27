import 'package:flutter/material.dart';

class FlexChildScrollView extends StatelessWidget {
  const FlexChildScrollView({
    Key? key,
    this.controller,
    required this.child,
  }) : super(key: key);

  final ScrollController? controller;
  final Widget child;

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
