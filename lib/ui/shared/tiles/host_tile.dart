import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/shared/tiles/host_icon_tile.dart';

enum HostTileType {
  regular,
  highlighted,
  removable,
  removableSelected,
}

class HostTile extends StatelessWidget {
  const HostTile({
    Key? key,
    required this.host,
    this.loadIcon = true,
    this.onPressed,
    this.onLongPress,
    this.trailing,
    this.type = HostTileType.regular,
  }) : super(key: key);

  final String? host;
  final bool loadIcon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget? trailing;
  final HostTileType type;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: type == HostTileType.highlighted ? 4.0 : 0.0,
        padding: const EdgeInsets.only(left: 12.0),
        // TODO verify how to apply colors
        // highlightElevation: type == HostTileType.highlighted ? 8.0 : 0.0,
        // color: type == HostTileType.highlighted
        //     ? R.colors.primaryLight
        //     : type == HostTileType.removableSelected
        //         ? R.colors.secondary.withOpacity(0.5)
        //         : R.colors.grayLight,
      ),
      key: ValueKey(host),
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Row(children: <Widget>[
        HostIconTile(host: loadIcon ? host : null),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 12.0),
            child: Text(
              host!,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: type == HostTileType.highlighted
                    ? R.colors.white
                    : R.colors.primary,
              ),
            ),
          ),
        ),
        if (trailing != null) trailing!,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Icon(
            type == HostTileType.removableSelected ||
                    type == HostTileType.removable
                ? Icons.delete
                : Icons.chevron_right,
            color: type == HostTileType.removableSelected
                ? R.colors.secondary
                : type == HostTileType.highlighted
                    ? R.colors.secondary
                    : R.colors.gray,
          ),
        ),
      ]),
    );
  }
}
