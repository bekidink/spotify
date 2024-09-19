import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/assets/app_images.dart';
import 'package:spotify/core/assets/app_vectors.dart';

Widget homeArtistCard(){
  return Center(
    child: SizedBox(
      height: 188,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(AppVectors.homeCard)),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Image.asset(
            AppImages.homeArtist
                    ),
          ),)
    
        ],
      ),
    ),
  );
}