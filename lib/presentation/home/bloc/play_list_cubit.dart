import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spotify/service_locator.dart';

import '../../../domain/usecases/song/get_playList.dart';
import 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState>{
  PlayListCubit():super(PlayListLoading());
  Future <void> getPlayList()async{
    var returnedSongs=await sl<GetPlayListUseCase>().call();
    if (kDebugMode) {
      print(returnedSongs);
    }
    returnedSongs.fold((l) {
      emit(PlayListLoadFailure());
    }, (data) {
      emit(PlayListloaded(songs: data));
    });
  }
}