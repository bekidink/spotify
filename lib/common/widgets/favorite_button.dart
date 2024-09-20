import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/bloc/favorite/favorite_cubit.dart';
import 'package:spotify/domain/entities/song/song.dart';

import '../../core/configs/theme/app_colors.dart';
import '../bloc/favorite/favorite_state.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity song;
  const FavoriteButton({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>FavoriteCubit(),
      child: BlocBuilder<FavoriteCubit,FavoriteState>(
        builder: (context, state) {
          if(state is FavoriteStateInitial){
            return IconButton(onPressed: (){
              context.read<FavoriteCubit>().favoriteUpdated(song.songId);
            }, icon:
              
               Icon(song.isFavorite?Icons.favorite: Icons.favorite_outline_rounded,color: AppColors.darkGrey,));
          }
           if(state is FavoriteUpdated){
            return IconButton(onPressed: (){
              context.read<FavoriteCubit>().favoriteUpdated(song.songId);
            }, icon:
              
               Icon(state.isFavorite?Icons.favorite: Icons.favorite_outline_rounded,color: AppColors.darkGrey,));
          }
          return Container();
        },
      ),
    );
  }
}