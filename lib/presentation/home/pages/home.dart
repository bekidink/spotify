import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/presentation/home/widgets/artist_card.dart';
import 'package:spotify/presentation/home/widgets/tabs.dart';

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
        hideback: true,
        title: SvgPicture.asset(AppVectors.log,height: 40,width: 40,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            homeArtistCard(),
            tabs(_tabController,context)
          ],
        ),
      ),
    );
  }
}