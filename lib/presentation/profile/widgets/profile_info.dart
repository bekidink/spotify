import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/profile/bloc/profile_cubit.dart';

import '../bloc/profile_state.dart';

Widget profileInfo(BuildContext context){
  return BlocProvider(
    create: (context)=>ProfileCubit()..getUser(),
    child: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height/3.5,
      decoration: BoxDecoration(
        borderRadius:const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        ),
        color: context.isDarkMode?AppColors.darkGrey:Colors.white
      ),
      child: BlocBuilder<ProfileCubit,ProfileState>(builder: (context,state){
        if(state is ProfileLoading){
          return CircularProgressIndicator();
        }
        if(state is ProfileLoaded){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(state.userEntity.imageUrl!))
                ),
              ),
              SizedBox(height: 20,),
              Text(state.userEntity.email!),
              SizedBox(height: 10,),
              Text(state.userEntity.fullName!,style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),)
            ],
          );
        }
        if(state is ProfileFailure){
          return Text('please try again');
        }
        return Container();
      },),
    ),
  );
}