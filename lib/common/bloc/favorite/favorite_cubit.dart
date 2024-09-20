import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/bloc/favorite/favorite_state.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_fav.dart';

import '../../../service_locator.dart';

class FavoriteCubit extends Cubit<FavoriteState>{
  FavoriteCubit():super(FavoriteStateInitial());

  void favoriteUpdated(String songId)async{
    var result=await sl<AddOrRemoveFavUseCase>().call(
      params: songId
    );
    result.fold((l) {}, (isFavorite) {
      emit(FavoriteUpdated(isFavorite: isFavorite));
    });

  }
}