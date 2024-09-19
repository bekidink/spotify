import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

Widget tabs(TabController _tabController,BuildContext context){
  return TabBar(
    controller: _tabController,
    isScrollable: true,
    indicatorColor: AppColors.primary,
    labelColor: context.isDarkMode? Colors.white:Colors.black,
    padding: EdgeInsets.symmetric(
      vertical: 40,
      horizontal: 16
    ),
    tabs: [
Text('News',style: TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16
),),
Text('Videos',style: TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16
)),
Text('Artist',style: TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16
)),
Text('Podcasts',style: TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16
))
  ]);
}