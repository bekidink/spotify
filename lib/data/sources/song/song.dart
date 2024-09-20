import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/usecases/song/is_fav_song.dart';

import '../../../domain/entities/song/song.dart';
import '../../../service_locator.dart';

abstract class SongFirebaseService{
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
   Future<Either> getUserPlayList();
  Future<Either> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavoriteSong(String songId);
}
class SongFirebaseServiceImpl extends SongFirebaseService{
  @override
  Future<Either> getNewsSongs()async {
   try{
     List<SongEntity> songs=[];
    var data=await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate',descending: true).limit(3).get();
    for(var element in data.docs){
      bool isFavorite=await sl<IsFavoriteSongUseCase>().call(
        params:element.reference.id
      );
      
      var songModel=SongModel.fromJson(element.data());
     songModel.isFavorite=isFavorite;
     songModel.songId=element.reference.id;
      songs.add(songModel.toEntity());
    }
    
    return Right(songs);
   }catch(e){
    print(e);
    return Left('An error occurred,please try again');
   }
  }
  
  @override
  Future<Either> getPlayList()async {
    try{
     List<SongEntity> songs=[];
    var data=await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate',descending: true).limit(3).get();
    for(var element in data.docs){
      var songModel=SongModel.fromJson(element.data());
      bool isFavorite = await sl<IsFavoriteSongUseCase>().call(
          params: element.reference.id 
        );
        songModel.isFavorite = isFavorite;
        songModel.songId = element.reference.id;
      songs.add(songModel.toEntity());
    }
    
    return Right(songs);
   }catch(e){
    
    return Left('An error occurred,please try again');
   }
  }
  
  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    try{
   final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
   late bool isFavorite;
    final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    var user=firebaseAuth.currentUser;
    String uId=user!.uid;
    QuerySnapshot favoriteSongs=await firebaseFirestore.collection('Users').doc(uId).collection('Favorites').where('songId',isEqualTo:songId ).get();
 if(favoriteSongs.docs.isNotEmpty){
  await favoriteSongs.docs.first.reference.delete();
  isFavorite=false;
 }else{
  await firebaseFirestore.collection('Users').doc(uId).collection('Favorites').add(
    {
      'songId':songId,
      'addedDate':Timestamp.now()
    }
  );
 isFavorite=true;
 }
 return Right(isFavorite);
 }catch(e){
return Left('Error occur,try again');

 }
  }
  
  @override
  Future<bool> isFavoriteSong(String songId) async{
    try{
   final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  
    final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    var user=firebaseAuth.currentUser;
    String uId=user!.uid;
    QuerySnapshot favoriteSongs=await firebaseFirestore.collection('Users').doc(uId).collection('Favorites').where('songId',isEqualTo:songId ).get();
 if(favoriteSongs.docs.isNotEmpty){
 return true;
 }else{
  return false;
 }
 }catch(e){
return false;

 }
  }
  
  @override
  Future<Either> getUserPlayList() async{
     try{
   final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  
    final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    var user=firebaseAuth.currentUser;
    String uId=user!.uid;
    QuerySnapshot favoriteSongs=await firebaseFirestore.collection('Users').doc(uId).collection('Favorites').get();
    
 List<SongEntity>songs=[];
 for(var element in favoriteSongs.docs){
String songId=element['songId'];
var song=await firebaseFirestore.collection('Songs').doc(songId).get();
SongModel songModel=SongModel.fromJson(song.data()!);
 songModel.isFavorite=true;
 songModel.songId=songId;
 songs.add(songModel.toEntity());
 }
 return Right(songs);
 }catch(e){
return Left('Error occurr,try again');

 }
  }
  
}