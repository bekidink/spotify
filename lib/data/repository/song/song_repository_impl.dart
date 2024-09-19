import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/song.dart';
import 'package:spotify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongsRepositoryImpl extends SongsRepository{
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
   
  }
  
  @override
  Future<Either> getPlayList() async{
   return await sl<SongFirebaseService>().getPlayList();
  }
  
}