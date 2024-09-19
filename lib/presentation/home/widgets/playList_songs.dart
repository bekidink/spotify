
import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

import '../../../domain/entities/song/song.dart';

Widget playListSongs(List<SongEntity> songs,BuildContext context){
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context,index){
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode? AppColors.darkGrey:const Color(0xffE6E6E6)
                ),
                child: Icon(Icons.play_arrow_rounded,color: context.isDarkMode?const Color(0xff959595):const Color(0xff555555),),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(songs[index].title,style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),maxLines: 1,),
                  Text(songs[index].artist,style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                  ),)
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(songs[index].duration.toString().replaceAll('.', ":")),
              SizedBox(width: 10,),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_rounded))
            ],
          )
        ],
      ),
    );
  }, separatorBuilder: (context,index)=>const SizedBox(height: 16,), itemCount:songs.length );
}