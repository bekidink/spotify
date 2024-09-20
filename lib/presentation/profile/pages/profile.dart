import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/app_bar.dart';
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
        children: [
          profileInfo(context)
        ],
      ),
    );
  }
}