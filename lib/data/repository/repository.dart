import 'package:myapp/data/source/source.dart';

import '../model/song.dart';

abstract interface class Repository {
  Future<List<Song>?> loadData();
}

class DefaultRepository implements Repository {
  final _localDataSource = LocalDataSource();
  final _remoteDataSource = RemoteDataSource();

  @override
  Future<List<Song>?> loadData() async {
    List<Song> songs = [];
    await _remoteDataSource.loadData().then((remoteSong) {
      if (remoteSong != null) {
        songs.addAll(remoteSong);
      } else {
        _localDataSource.loadData().then((localSong) {
          if (localSong != null) {
            songs.addAll(localSong);
          }
        });
      }
    });

    return songs;
  }
}
