import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path;

@singleton
class FaviconService {
  const FaviconService(
    this.baseUrl,
    this.validFormats,
    this.expiryTime,
  );

  @factoryMethod
  factory FaviconService.create() => const FaviconService(
        'https://api.faviconkit.com/',
        {'image/png', 'image/vnd.microsoft.icon'},
        Duration(days: 7),
      );

  final String baseUrl;
  final Set<String> validFormats;
  final Duration expiryTime;

  Future<Uint8List> load(String url) async {
    final dir = await path.getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$url");
    if (!await _isIconValid(file)) {
      await _tryFetchIcon(url).then(file.writeAsBytes);
    }
    return await file.readAsBytes();
  }

  Future<Uint8List> _tryFetchIcon(String url) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl$url"));
      final contentType = response.headers['content-type'];
      if (response.statusCode != 200) {
        throw FaviconError.serverError;
      } else if (!validFormats.contains(contentType)) {
        throw FaviconError.invalidFormat;
      }
      return response.bodyBytes;
    } on SocketException {
      throw FaviconError.couldNotConnect;
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

enum FaviconError {
  serverError,
  invalidFormat,
  couldNotConnect,
}
