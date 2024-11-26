import 'dart:convert';

import '../model/song.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

abstract interface class DataSource {
  Future<List<Song>?> loadData();
}

class RemoteDataSource implements DataSource {
  @override
  Future<List<Song>?> loadData() async {
    const url = 'https://thantrieu.com/resources/braniumapis/songs.json';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final bodyContent = utf8.decode(response.bodyBytes);
      var songWrapper = jsonDecode(bodyContent) as Map;
      var songList = songWrapper['songs'] as List;
      return songList.map((song) => Song.fromJson(song)).toList();
    }
    return null;
  }
}

class LocalDataSource implements DataSource {
  @override
  Future<List<Song>?> loadData() async {
    final String response = await rootBundle.loadString('assets/songs.json');
    var jsonBody = jsonDecode(response) as Map;
    var songList = jsonBody['songs'] as List;
    return songList.map((song) => Song.fromJson(song)).toList();
  }
}
