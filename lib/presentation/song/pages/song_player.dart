import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/widgets/app_bar.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/song/bloc/song_cubit.dart';
import 'package:spotify/presentation/song/widgets/songPlayer.dart';
import 'package:spotify/presentation/song/widgets/song_cover.dart';
import 'package:spotify/presentation/song/widgets/song_detail.dart';

import '../../../core/configs/constants/app_urls.dart';

class SongPlayerPage extends StatelessWidget {
  const SongPlayerPage({super.key, required this.song});
final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MainAppBar(
        title: const Text('Now playing',style: TextStyle(
          fontSize: 18
        ),),
        action: IconButton(onPressed: (){}, icon:const Icon(Icons.more_vert_rounded)),
      ) ,
      body: BlocProvider(
        create: (_)=>SongCubit()..loadSong(
           '${AppURLs.audioUrl}songs%2F${Uri.encodeComponent(song.title.trim())}.mp3?${AppURLs.mediaAlt}'
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            children: [
              songCover(context, song),
              SizedBox(height: 15,),
              songDetail(context, song),
              SizedBox(height: 15,),
              songPlayer(context)
            ],
          ),
        ),
      ),
    );
  }
}