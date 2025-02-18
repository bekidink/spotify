import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/get_user.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/entities/auth/user.dart';

abstract class AuthFirebaseService{
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signIn(SigninUserReq signinUserReq);
   Future<Either> getUser();
}
class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signIn( SigninUserReq signinUserReq) async {
   try {

     var data= await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password:signinUserReq.password
      );
     

      return const Right('Signin was Successful');

    } on FirebaseAuthException catch(e) {
      String message = '';
      
      if(e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }


      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async{
   try{
var data=    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: createUserReq.email, password: createUserReq.password);
  
   FirebaseFirestore.instance.collection('Users').doc(data.user?.uid).set({
        'name':createUserReq.fullName,
        'email':data.user?.email
      });
   return Right('Signup was Successfull');
   }on FirebaseAuthException catch(e){

String message='';
if(e.code=='weak-password'){
  message="The password provided is too weak";
}else if(e.code=="email-already-in-use"){
  message='An account already exists with that email';
}
return Left(message);
   }
  }
  
  @override
  Future<Either> getUser()async {
   try{
     FirebaseAuth firebaseAuth=FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
 var user= await  firebaseFirestore.collection('Users').doc(
      firebaseAuth.currentUser?.uid
    ).get();
GetUserModel userModel=GetUserModel.fromJson(user.data()!);
userModel.imageUrl=firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultUrl;
GetUserEntity getUserEntity=userModel.toEntity();
return Right(getUserEntity);
   }catch(e){
 return const Left('Error occured,try again');
   }
  }
  
}