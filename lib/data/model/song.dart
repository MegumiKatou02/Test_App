/*,
      "duration": 224,
      "favorite": "false",
      "counter": 20,
      "replay": 0
 */

class Song {
  String id;
  String title;
  String album;
  String artist;
  String source;
  String image;
  String duration;
  bool favorite;
  String counter;
  String replay;

  Song({
    required this.id,
    this.favorite = false,
    this.counter = "0",
    this.replay = "0",
    required this.title,
    required this.album,
    required this.artist,
    required this.source,
    required this.image,
    required this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> map) {
    return Song(
      id: map['id'],
      title: map['title'],
      album: map['album'],
      artist: map['artist'],
      source: map['source'],
      image: map['image'],
      duration: map['duration'],
      favorite: map['favorite'] == 'true',
      counter: map['counter'].toString(),
      replay: map['replay'].toString(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Song && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
