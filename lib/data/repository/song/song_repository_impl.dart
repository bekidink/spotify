import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  
  @override
  Future<Either> addOrRemoveFavoriteSong(String songId)async {
    
   return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }
  
  @override
  Future<bool> isFavoriteSong(String songId)async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }
  
}