import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/common/widgets/favorite_button.dart';
import 'package:spotify/domain/entities/song/song.dart';

import '../../../core/configs/theme/app_colors.dart';

Widget songDetail(BuildContext context,SongEntity song){
  return   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
             
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(song.title,style:const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),maxLines: 1,),
                  Text(song.artist,style:const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),)
                ],
              )
            ],
          ),
         FavoriteButton(song: song)
        ],
      );
}