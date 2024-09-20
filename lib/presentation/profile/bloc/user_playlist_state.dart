import 'package:spotify/domain/entities/auth/user.dart';

import '../../../domain/entities/song/song.dart';

abstract class UserPlayListState{}
class UserPlayListLoading extends UserPlayListState{}
class UserPlayListLoaded extends UserPlayListState{
  final List<SongEntity> songs;

  UserPlayListLoaded({required this.songs});

  
}
class UserPlayListFailure extends UserPlayListState{}
