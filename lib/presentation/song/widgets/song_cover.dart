import 'package:flutter/material.dart';
import 'package:spotify/domain/entities/song/song.dart';

import '../../../core/configs/constants/app_urls.dart';

Widget songCover(BuildContext context ,SongEntity song){
  return Container(
    height: MediaQuery.of(context).size.height/2,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
         AppURLs.firestorage + 'covers%2F' + Uri.encodeComponent(song.artist.trim()) + '.jfif?' + AppURLs.mediaAlt 
      ))
    ),
  );
}