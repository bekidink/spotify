import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

Widget profileInfo(BuildContext context){
  return Container(
    height: MediaQuery.of(context).size.height/3.5,
    decoration: BoxDecoration(
      borderRadius:const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30)
      ),
      color: context.isDarkMode?AppColors.darkGrey:Colors.white
    ),
  );
}