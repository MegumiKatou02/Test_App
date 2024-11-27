import 'dart:async';

import 'package:myapp/data/repository/repository.dart';

import '../../data/model/song.dart';

class MusicAppViewModal {
  StreamController<List<Song>> songStream = StreamController();

  void loadSong() {
    final repository = DefaultRepository();
    repository.loadData().then((value) => songStream.add(value!));
  }
}
