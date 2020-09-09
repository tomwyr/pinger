import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';

class InfoTrayConnectivityItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: R.colors.none,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(children: <Widget>[
          Expanded(
            child: Text(
              S.current.infoTrayNetworkDisabled,
              style: TextStyle(color: R.colors.white),
            ),
          ),
          Container(width: 16.0),
          Icon(Icons.signal_wifi_off, color: R.colors.white),
        ]),
      ),
    );
  }
}
