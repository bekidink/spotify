import 'package:spotify/domain/entities/song/song.dart';

abstract class NewsSongsState{}
class NewsSongsLoading extends NewsSongsState{}
class NewsSongsloaded extends NewsSongsState{
  final List<SongEntity>songs;
  NewsSongsloaded({required this.songs});
}
class NewsSongsLoadFailure extends NewsSongsState{}