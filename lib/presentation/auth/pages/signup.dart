import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/app_bar.dart';
import 'package:spotify/common/widgets/basic_button.dart';
import 'package:spotify/core/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/widgets/emailField.dart';
import 'package:spotify/presentation/auth/widgets/nameField.dart';
import 'package:spotify/presentation/auth/widgets/passwordField.dart';
import 'package:spotify/presentation/auth/widgets/registerText.dart';
import 'package:spotify/presentation/auth/widgets/signText.dart';
import 'package:spotify/presentation/home/pages/home.dart';

import '../../../service_locator.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});
 final TextEditingController _fullname=TextEditingController();
  final TextEditingController _email=TextEditingController();
   final TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:signInText('Sign In','Do you have account?',(){
         Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context)=> SignIn()));
      }) ,
      appBar: MainAppBar(
        title: SvgPicture.asset(AppVectors.log,height: 40,width: 40,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            registerText('Register'),
        const    SizedBox(height: 50,),
            nameField(context,'Full name',_fullname),
        const    SizedBox(height: 30,),
            emailField(context, 'email@gmail.com',_email),
        const    SizedBox(height: 30,),
            passwordField(context, 'password',_password),
        const    SizedBox(height: 20,),
            BasicButton(onPressed: ()async{
              var result=await sl<SignupuseCase>().call(
                params: CreateUserReq(fullName: _fullname.text, email: _email.text, password: _password.text)
              );
result.fold((l)  {
  var snackBar=SnackBar(content: Text(l));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}, (r) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=> HomePage()),(route)=>false);
} );
            }, title: 'Create  Account')
          ],
        ),
      ),
    );
 
 
  }
}