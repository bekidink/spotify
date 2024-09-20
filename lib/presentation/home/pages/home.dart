import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/presentation/home/widgets/artist_card.dart';
import 'package:spotify/presentation/home/widgets/news_songs.dart';
import 'package:spotify/presentation/home/widgets/play_list.dart';
import 'package:spotify/presentation/home/widgets/tabs.dart';
import 'package:spotify/presentation/profile/pages/profile.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../core/assets/app_vectors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 4,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        action: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const ProfilePage()));
        }, icon:const Icon(Icons.person)),
        hideback: true,
        title: SvgPicture.asset(AppVectors.log,height: 40,width: 40,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            homeArtistCard(),
            tabs(_tabController,context),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
            const    NewsSongs(),
                Container(),
                Container(),
                Container()
              ]),
            ),
            const SizedBox(height: 10,),
            const PlayList()
          ],
        ),
      ),
    );
  }
}