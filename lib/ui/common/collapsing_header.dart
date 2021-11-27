import 'package:flutter/material.dart';

typedef Widget CollapsingHeaderBuilder(
  BuildContext context,
  double expansion,
  Widget content,
);

class CollapsingHeader extends StatefulWidget {
  final bool isExpanded;
  final String title;
  final Widget content;
  final Widget bottom;
  final Duration duration;
  final CollapsingHeaderBuilder? builder;

  const CollapsingHeader({
    Key? key,
    required this.isExpanded,
    required this.title,
    required this.content,
    required this.bottom,
    required this.duration,
    this.builder,
  }) : super(key: key);

  @override
  _CollapsingHeaderState createState() => _CollapsingHeaderState();
}

class _CollapsingHeaderState extends State<CollapsingHeader> with SingleTickerProviderStateMixin {
  late AnimationController _animator;
  late Animation<double> _baseAnim;
  late Animation<double> _heightAnim;
  late Animation<AlignmentGeometry?> _alignAnim;

  @override
  void initState() {
    super.initState();
    _animator = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.isExpanded ? 1.0 : 0.0,
    );
    _baseAnim = CurvedAnimation(
      parent: _animator,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
    _heightAnim = Tween<double>(begin: 0.5, end: 1.0).animate(_baseAnim);
    _alignAnim = AlignmentGeometryTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(_baseAnim);
  }

  @override
  void didUpdateWidget(CollapsingHeader old) {
    super.didUpdateWidget(old);
    if (old.isExpanded != widget.isExpanded) {
      widget.isExpanded ? _animator.forward() : _animator.reverse();
    }
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizeTransition(
          sizeFactor: _heightAnim,
          axisAlignment: -1.0,
          child: SizedBox(
            height: 2 * kToolbarHeight,
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: AppBar(
                  leading: BackButton(),
                  title: FadeTransition(
                    opacity: _baseAnim,
                    child: Text(widget.title),
                  ),
                  centerTitle: true,
                ),
              ),
              AnimatedBuilder(
                animation: _animator,
                builder: (_, child) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 56.0 * (1 - _animator.value),
                  ),
                  child: Align(
                    alignment: _alignAnim.value!,
                    child: SizedBox(
                      height: kToolbarHeight,
                      child: widget.builder != null
                          ? widget.builder!(
                              context,
                              _animator.value,
                              widget.content,
                            )
                          : widget.content,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        FadeTransition(
          opacity: _baseAnim,
          child: SizeTransition(
            sizeFactor: _baseAnim,
            child: widget.bottom,
          ),
        ),
        Container(height: 8.0),
      ],
    );
  }
}
