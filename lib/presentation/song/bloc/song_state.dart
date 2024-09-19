import 'package:spotify/domain/entities/song/song.dart';

abstract class SongState{}
class SongLoading extends SongState{}
class Songloaded extends SongState{
  // final List<SongEntity>songs;
  // Songloaded({required this.songs});
}
class SongLoadFailure extends SongState{}