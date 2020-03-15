import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path;

typedef UrlWrapper = String Function(String);

class FaviconService {
  static final UrlWrapper google =
      (url) => "https://www.google.com/s2/favicons?domain=$url";

  static final UrlWrapper faviconKit =
      (url) => "https://api.faviconkit.com/$url";

  final Duration expiryTime;
  final UrlWrapper urlWrapper;

  FaviconService({
    @required this.urlWrapper,
    this.expiryTime = const Duration(days: 7),
  });

  Future<Uint8List> load(String url) async {
    final dir = await path.getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$url");
    if (await _isIconValid(file)) {
      return await file.readAsBytes();
    } else {
      final bytes = (await http.get(urlWrapper(url))).bodyBytes;
      await file.writeAsBytes(bytes);
      return bytes;
    }
  }

  Future<bool> _isIconValid(File file) async {
    if (await file.exists()) {
      final modDate = await file.lastModified();
      return DateTime.now().difference(modDate) < expiryTime;
    }
    return false;
  }
}
