import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/common/draggable_sheet.dart';
import 'package:pinger/ui/info_tray/info_tray.dart';
import 'package:pinger/ui/info_tray/info_tray_entry.dart';

class InfoTraySheet extends StatelessWidget {
  static const _handleWidth = 64.0;
  static const _handleHeight = 32.0;
  static const _borderRadius = 12.0;
  static const _padding = EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0);
  static const _animDuration = Duration(milliseconds: 500);

  final DraggableSheetController controller;
  final VoidCallback onHandleTap;
  final ValueChanged<Set<InfoTrayItem>> onVisibilityChanged;
  final List<InfoTrayEntry> items;
  final Widget child;

  const InfoTraySheet({
    Key key,
    @required this.controller,
    @required this.onHandleTap,
    @required this.onVisibilityChanged,
    @required this.items,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SeparatedDraggableSheet<InfoTrayItem>(
      controller: controller,
      duration: _animDuration,
      animateVisibility: true,
      child: child,
      items: items,
      onVisibilityChanged: onVisibilityChanged,
      contentBuilder: (_, children) => _buildTray(children),
      handleBuilder: (_) => _buildHandle(),
      separatorBuilder: (_) => _buildSeparator(),
    );
  }

  Widget _buildTray(List<Widget> children) {
    return Padding(
      padding: _padding.copyWith(top: 0.0),
      child: StreamBuilder<double>(
        initialData: controller.currentExpansion,
        stream: controller.expansion,
        builder: (_, snapshot) => DecoratedBox(
          decoration: _buildDecoration(
            expansion: snapshot.data,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(_borderRadius * (1.0 - snapshot.data) * 2),
              bottom: Radius.circular(_borderRadius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Padding(
      padding: _padding.copyWith(bottom: 0.0),
      child: SizedBox(
        height: _handleHeight,
        child: LayoutBuilder(
          builder: (_, constraints) => StreamBuilder<double>(
            stream: controller.expansion,
            initialData: controller.currentExpansion,
            builder: (_, snapshot) => Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: _handleHeight * (1.0 - snapshot.data / 2),
                width: _handleWidth +
                    (constraints.maxWidth - _handleWidth) * snapshot.data,
                child: GestureDetector(
                  onTap: onHandleTap,
                  child: DecoratedBox(
                    decoration: _buildDecoration(
                      expansion: snapshot.data,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(_handleWidth),
                      ),
                    ),
                    child: CustomPaint(
                      painter: InfoTrayHandlePainter(
                        expansion: snapshot.data,
                        color: R.colors.white,
                        width: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        height: 0.25,
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        color: R.colors.white,
      ),
    );
  }

  BoxDecoration _buildDecoration({
    @required double expansion,
    @required BorderRadiusGeometry borderRadius,
  }) {
    final color = ColorTween(
      begin: R.colors.secondary,
      end: R.colors.primaryLight,
    ).transform(expansion);
    return BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: 4.0,
          spreadRadius: 1.0,
        )
      ],
      borderRadius: borderRadius,
    );
  }
}

class InfoTrayHandlePainter extends CustomPainter {
  final Color color;
  final double expansion;
  final double width;
  final double strokeWidth = 2.0;

  InfoTrayHandlePainter({
    @required this.color,
    @required this.expansion,
    @required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final lineWidth = width / 3 + width / 2 * expansion;
    final lineHeight = size.height / 6 * (1.0 - expansion);
    final startX = size.width / 2 - lineWidth;
    final startY = (size.height + lineHeight) / 2 + (2.0 * (1.0 - expansion));
    final path = Path()
      ..moveTo(startX, startY)
      ..relativeLineTo(lineWidth, -lineHeight)
      ..relativeLineTo(lineWidth, lineHeight);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = color
      ..strokeWidth = strokeWidth;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(InfoTrayHandlePainter old) =>
      old.color != color ||
      old.expansion != expansion ||
      old.width != width ||
      old.strokeWidth != strokeWidth;
}
