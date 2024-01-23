import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/shared/tiles/host_tile.dart';

class HomeHostsSection extends StatelessWidget {
  const HomeHostsSection({
    super.key,
    required this.title,
    required this.hosts,
    required this.itemLimit,
    required this.onItemPressed,
    this.tileType = HostTileType.regular,
    this.emptyLabel,
    this.onMorePressed,
  });

  final String title;
  final List<String>? hosts;
  final int itemLimit;
  final String? emptyLabel;
  final HostTileType tileType;
  final ValueChanged<String> onItemPressed;
  final VoidCallback? onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildSectionTitle(),
          if (hosts!.isNotEmpty)
            _buildHostsSection()
          else if (emptyLabel != null)
            _buildEmptySection()
        ],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        if (hosts!.isNotEmpty && onMorePressed != null)
          GestureDetector(
            onTap: onMorePressed,
            child: Text(
              S.current.moreHostsButtonLabel,
              style: TextStyle(color: R.colors.secondary),
            ),
          )
      ]),
    );
  }

  Widget _buildHostsSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ...hosts!.take(itemLimit).map((it) => Padding(
              padding: EdgeInsets.only(top: it == hosts!.first ? 0.0 : 16.0),
              child: HostTile(
                host: it,
                type: tileType,
                onPressed: () => onItemPressed(it),
              ),
            )),
        if (onMorePressed != null && hosts!.length > itemLimit)
          GestureDetector(
            onTap: onMorePressed,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
              child: Text(
                S.current.moreHostsCountButtonLabel(hosts!.length - itemLimit),
                style: TextStyle(color: R.colors.gray),
              ),
            ),
          )
        else
          Container(height: 8.0),
      ],
    );
  }

  Widget _buildEmptySection() {
    return DottedBorder(
      padding: const EdgeInsets.all(16.0),
      color: R.colors.gray,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12.0),
      child: Text(
        emptyLabel!,
        textAlign: TextAlign.center,
        style: TextStyle(color: R.colors.gray),
      ),
    );
  }
}
