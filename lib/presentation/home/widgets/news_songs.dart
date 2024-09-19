import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify/presentation/home/widgets/songs.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit,NewsSongsState>(builder: (context, state) {
          if(state is NewsSongsLoading){
            return Container(
              alignment: Alignment.center,
              child:const CircularProgressIndicator());
          }
          if(state is NewsSongsloaded){
return songs(state.songs, context);
          }
          return Container();
        },),
        
      ),
    );
  }

}
