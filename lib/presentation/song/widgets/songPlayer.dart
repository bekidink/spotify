import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/song/bloc/song_cubit.dart';
import 'package:spotify/presentation/song/bloc/song_state.dart';

Widget songPlayer(BuildContext context){
  return BlocBuilder<SongCubit,SongState>(builder: (context,state){
    if(state is SongLoading){
      return CircularProgressIndicator();
    }
    if(state is Songloaded){
      return Column(
        children: [
          Slider(value: context.read<SongCubit>().songPosition.inSeconds.toDouble(), min: 0.0, max: context.read<SongCubit>().songDuration.inSeconds.toDouble(), onChanged: (value){})
       ,
       const SizedBox(height: 3,),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(formatDuration(context.read<SongCubit>().songPosition)),
          Text(formatDuration(context.read<SongCubit>().songDuration))
        ],
       ),
       SizedBox(height: 5,),
       GestureDetector(
        onTap: (){
          context.read<SongCubit>().playOrPauseSong();
        },
         child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary
          ),
          child: Icon(context.read<SongCubit>().audioPlayer.playing?Icons.pause:Icons.play_arrow),
               
         ),
       )
        ],
      );
    }
    return Container();
  });
}
String formatDuration(Duration duration){
  final minutes=duration.inMinutes.remainder(60);
  final seconds=duration.inSeconds.remainder(60);
  return '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
}