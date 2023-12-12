import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/common/scroll_edge_gradient.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';
import 'package:pinger/ui/shared/tiles/host_tile.dart';

class HostsPage extends StatefulWidget {
  const HostsPage({
    super.key,
    required this.title,
    required this.hosts,
    required this.getTrailingLabel,
    required this.removeHosts,
    required this.onHostSelected,
  });

  final String title;
  final List<String> hosts;
  final String Function(String) getTrailingLabel;
  final ValueChanged<List<String>> removeHosts;
  final ValueChanged<String> onHostSelected;

  @override
  State<HostsPage> createState() => _HostsPageState();
}

class _HostsPageState extends BaseState<HostsPage> {
  List<String> _selection = [];
  bool _isEditing = false;

  @override
  void didUpdateWidget(HostsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hosts.isEmpty) Future(PingerApp.router.pop);
  }

  void _onEditPressed() {
    if (!_isEditing) {
      setState(() => _isEditing = true);
    } else if (_selection.isEmpty) {
      setState(() => _isEditing = false);
    } else {
      _showConfirmRemoveSheet(onConfirmed: () {
        PingerApp.router.pop();
        widget.removeHosts(_selection);
        setState(() {
          _selection = [];
          _isEditing = false;
        });
      });
    }
  }

  void _showConfirmRemoveSheet({required VoidCallback onConfirmed}) {
    PingerBottomSheet.show(
      title: Text(
        S.current.confirmHostRemoveTitle,
        style: R.styles.bottomSheetTitle,
      ),
      subtitle: Text(
        S.current.confirmRemoveDesc,
        style: R.styles.bottomSheetSubtitle,
      ),
      rejectLabel: S.current.cancelButtonLabel,
      onAcceptPressed: onConfirmed,
    );
  }

  void _onItemPressed(String host) {
    if (!_isEditing) {
      widget.onHostSelected(host);
    } else {
      setState(() => _toggleSelection(host));
    }
  }

  void _onItemLongPress(String host) {
    setState(() {
      if (!_isEditing) {
        _isEditing = true;
        _selection.add(host);
      } else {
        _toggleSelection(host);
      }
    });
  }

  void _toggleSelection(String host) {
    if (!_selection.remove(host)) _selection.add(host);
  }

  void _onBackPressed() {
    if (_isEditing) {
      setState(() {
        _selection = [];
        _isEditing = false;
      });
    } else {
      PingerApp.router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isEditing,
      onPopInvoked: (_) => _onBackPressed(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: Text(
            !_isEditing ? widget.title : S.current.removeHostsPageTitle,
          ),
          centerTitle: true,
          actions: <Widget>[
            SizedBox.fromSize(
              size: const Size.square(56.0),
              child: IconButton(
                icon: Icon(_isEditing ? Icons.delete : Icons.delete_outline),
                onPressed: !_isEditing || _selection.isNotEmpty ? _onEditPressed : null,
                color: !_isEditing
                    ? R.colors.primaryLight
                    : _selection.isNotEmpty
                        ? R.colors.secondary
                        : R.colors.gray,
              ),
            ),
          ],
        ),
        body: ScrollEdgeGradient(
          color: R.colors.canvas,
          builder: (controller) => ListView.builder(
            controller: controller,
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            itemCount: widget.hosts.length,
            itemBuilder: (_, index) => _buildHostItem(index),
          ),
        ),
      ),
    );
  }

  Widget _buildHostItem(int index) {
    final item = widget.hosts[index];
    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? 0.0 : 16.0),
      child: HostTile(
        host: item,
        type: !_isEditing
            ? HostTileType.regular
            : _selection.contains(item)
                ? HostTileType.removableSelected
                : HostTileType.removable,
        trailing: !_isEditing
            ? SizedBox(
                width: 40.0,
                child: Text(
                  widget.getTrailingLabel(item),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: R.colors.gray,
                    fontSize: 14.0,
                  ),
                ),
              )
            : null,
        onPressed: () => _onItemPressed(item),
        onLongPress: () => _onItemLongPress(item),
      ),
    );
  }
}
