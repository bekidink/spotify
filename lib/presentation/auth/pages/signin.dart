import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/basic_button.dart';
import '../../../core/assets/app_vectors.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';
import '../widgets/emailField.dart';
import '../widgets/nameField.dart';
import '../widgets/passwordField.dart';
import '../widgets/registerText.dart';
import '../widgets/signText.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});
final TextEditingController _fullname=TextEditingController();
  final TextEditingController _email=TextEditingController();
   final TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      bottomNavigationBar:signInText('Sign Up','Do not you have account?',(){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context)=> SignUp()));
      }) ,
      appBar: MainAppBar(
        title: SvgPicture.asset(AppVectors.log,height: 40,width: 40,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            registerText('Login'),
          const  SizedBox(height: 80,),
            
            emailField(context, 'email@gmail.com',_email),
          const  SizedBox(height: 30,),
            passwordField(context, 'password',_password),
         const   SizedBox(height: 20,),
            BasicButton(onPressed: ()async{
               var result=await sl<SigninUseCase>().call(
                params: SigninUserReq( email: _email.text, password: _password.text)
              );
result.fold((l)  {
  var snackBar=SnackBar(content: Text(l));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}, (r) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=> HomePage()),(route)=>false);
} );
            }, title: 'Login')
          ],
        ),
      ),
    );
 
 
  }
}