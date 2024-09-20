import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/bloc/favorite/favorite_cubit.dart';
import 'package:spotify/presentation/profile/bloc/user_playlist_cubit.dart';
import 'package:spotify/presentation/profile/bloc/user_playlist_state.dart';

import '../../../common/widgets/favorite_button.dart';
import '../../../core/configs/constants/app_urls.dart';

Widget favoriteSongs(BuildContext context){
  return BlocProvider(create:(context)=>UserPlayListCubit()..getUserPlayerList(),child:Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('FAVORITE SONGS'),
        BlocBuilder<UserPlayListCubit,UserPlayListState>(builder: (context,state){
          if(state is UserPlayListLoading){
            return const CircularProgressIndicator();
          }
          if(state is UserPlayListLoaded){
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context,index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                       Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: NetworkImage(
                            AppURLs.firestorage + 'covers%2F' + Uri.encodeComponent(state.songs[index].artist.trim()) + '.jfif?' + AppURLs.mediaAlt
                      ))
                    ),
                  ),
                   const SizedBox(width: 10,),
                   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.songs[index].title,style:const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),maxLines: 1,),
                  Text(state.songs[index].artist,style:const TextStyle(
              
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                  ),)
                ],
              )
                    ],
                  )
                 ,
                 Row(
            children: [
              Text(state.songs[index].duration.toString().replaceAll('.', ":")),
           const   SizedBox(width: 10,),
             FavoriteButton(song: state.songs[index],function: (){
              context.read<UserPlayListCubit>().removeSong(index);
             },)
            ],
          )
              
                ],
              );
            }, separatorBuilder: (context,index)=>SizedBox(height: 6,), itemCount: state.songs.length);
          }
          if(state is UserPlayListFailure){
            return const Text('Please try again');
          }
          return Container();
        })
      ],
    ),
  ) , );
}