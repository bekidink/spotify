
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/home/bloc/play_list_cubit.dart';
import 'package:spotify/presentation/home/bloc/play_list_state.dart';
import 'package:spotify/presentation/home/widgets/playList_songs.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit,PlayListState>(builder: (context, state) {
        if(state is PlayListLoading){
          return Container(
            alignment: Alignment.center,
            child:const CircularProgressIndicator(),
          );
        }
        if(state is PlayListloaded){
          return  Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 40),
            child: Column(
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('PlayList',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                Text('See More',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xffC6C6C6)
                ))
              ],
            ),
            SizedBox(height: 5,),
            playListSongs(state.songs, context)
              ],
            ),
          );
        }
        return Container();
      },),
    );
  }
}