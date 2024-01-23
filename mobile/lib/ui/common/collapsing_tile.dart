import 'package:flutter/material.dart';
import 'package:pinger/ui/common/inline_multi_child_layout_delegate.dart';

class CollapsingTile extends StatelessWidget {
  const CollapsingTile({
    super.key,
    required this.expansion,
    required this.avatar,
    required this.label,
  });

  final double expansion;
  final Widget avatar;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: InlineMultiChildLayoutDelegate<double>(
        config: expansion,
        performLayout: (size, self) {
          final constraints = BoxConstraints.loose(size);
          final avatarSize = self.layoutChild(CollapsingTileItem.avatar, constraints);
          final labelSize = self.layoutChild(CollapsingTileItem.label, constraints);
          final totalSize =
              Size(avatarSize.width + labelSize.width, avatarSize.height + labelSize.height);
          final avatarX = (constraints.maxWidth -
                  (totalSize.width - avatarSize.width) * (1 - expansion) -
                  avatarSize.width) /
              2;
          final labelX =
              (constraints.maxWidth - labelSize.width + avatarSize.width * (1 - expansion)) / 2;
          const avatarY = 0.0;
          final labelY = avatarSize.height * expansion;
          self.positionChild(CollapsingTileItem.avatar, Offset(avatarX, avatarY));
          self.positionChild(CollapsingTileItem.label, Offset(labelX, labelY));
        },
      ),
      children: <Widget>[
        LayoutId(id: CollapsingTileItem.avatar, child: avatar),
        LayoutId(id: CollapsingTileItem.label, child: label),
      ],
    );
  }
}

enum CollapsingTileItem { avatar, label }
