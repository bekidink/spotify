import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/domain/usecases/auth/getUser.dart';
import 'package:spotify/domain/usecases/song/get_user_playlist.dart';
import 'package:spotify/presentation/profile/bloc/profile_state.dart';
import 'package:spotify/service_locator.dart';

import 'user_playlist_state.dart';

class UserPlayListCubit extends Cubit<UserPlayListState>{
  UserPlayListCubit():super(UserPlayListLoading());
  List<SongEntity> favoriteSongs=[];
  Future<void> getUserPlayerList() async{
    var user=await sl<GetUserPlayListUseCase>().call();
    user.fold((l) {
      emit(UserPlayListFailure());
    }, (songsEntity) {
      favoriteSongs=songsEntity;
      emit(
        UserPlayListLoaded(songs: songsEntity)
      );
    });
  }
  void removeSong(int index){
    favoriteSongs.removeAt(index);
    emit(
      UserPlayListLoaded(songs: favoriteSongs)
    );
  }
  
}