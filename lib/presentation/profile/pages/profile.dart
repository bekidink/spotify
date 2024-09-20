import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/app_bar.dart';
import 'package:spotify/presentation/profile/widgets/favorite_songs.dart';
import 'package:spotify/presentation/profile/widgets/profile_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        backgroundColor:const Color(0xff2C2B2B),
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileInfo(context),
        const  SizedBox(height: 20,),
          favoriteSongs(context)
        ],
      ),
    );
  }
}