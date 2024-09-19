import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/common/widgets/app_bar.dart';
import 'package:spotify/common/widgets/basic_button.dart';
import 'package:spotify/core/assets/app_images.dart';
import 'package:spotify/core/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SignInOrSignUp extends StatelessWidget {
  const SignInOrSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          const MainAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern
            ),
          ),
           Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern
            ),
          ),
           Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBG
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppVectors.log
                ),
               const SizedBox(height: 55,),
               const Text("Enjoy Listening To Music",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26
                ),),
                const SizedBox(height: 26,),
                const Text('Enjoy Listening To Music Enjoy Listening To Music ',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColors.grey
                ),
                textAlign: TextAlign.center,
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: BasicButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> SignUp()));
                      }, title: 'Sign Up'),
                    
                    ),
                 const   SizedBox(height: 20,),
                   Expanded(child: TextButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> SignIn()));
                   }, child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:context.isDarkMode? Colors.white: Colors.black
                    ),
                   )))
                    
                    
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}