  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

import '../../../domain/entities/song/song.dart';

Widget songs(List<SongEntity> songs,BuildContext context){
  print(songs.length);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        print(AppURLs.firestorage + 'covers%2F' + Uri.encodeComponent(songs[index].artist.trim()) + '.jfif?' + AppURLs.mediaAlt);
        return SizedBox(
          width: 160,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: 
                   NetworkImage(
                            AppURLs.firestorage + 'covers%2F' + Uri.encodeComponent(songs[index].artist.trim()) + '.jfif?' + AppURLs.mediaAlt
                          )
                    )
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(10, 10, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode?AppColors.darkGrey:const Color(0xffE6E6E6)
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color:context.isDarkMode?Color(0xff959595): Color(0xff555555),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                songs[index].title,
                style:const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
                ),
              ),
           const   SizedBox(height: 5,),
              Text(
                songs[index].artist,
                style:const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,

                ),
              )
            ],
          ),
        );
      },
      itemCount:songs.length ,
      separatorBuilder: (context, index) => SizedBox(width: 14,),
    );
  }