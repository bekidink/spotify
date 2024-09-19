import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/basic_button.dart';
import 'package:spotify/core/assets/app_images.dart';
import 'package:spotify/core/assets/app_vectors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';
import 'package:spotify/presentation/splash/pages/splash.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding:const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            decoration:const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                AppImages.introBG
              )
              )
            ),
           
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
             child: Column(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVectors.log
                  ),
                ),
             const   Spacer(),
              const  Text(
                  'Enjoy Listening to Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
                       const    SizedBox(
                  height: 21,
                ),
                 const  Text(
                  'Enjoy Listening to Music Enjoy Listening to Music Enjoy Listening to Music',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 10,
                  
                  ),
                  textAlign: TextAlign.center,
                ),
               const SizedBox(height: 20,),
                BasicButton(onPressed: (){
                  
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>const ChooseModePage()));
                }, title: 'Get Started')
              ],),
           ),
        ],
      ),
    );
  }


}