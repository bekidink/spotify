import 'package:spotify/domain/entities/auth/user.dart';

class GetUserModel{
   String? fullName;
   String? email;
   String? imageUrl;

  GetUserModel({ this.fullName,  this.email,  this.imageUrl});
GetUserModel.fromJson(Map<String,dynamic>data){
  fullName=data['name'];
  email=data['email'];
  imageUrl=data['imageUrl'];

}


}

extension UserModelX on GetUserModel{
  GetUserEntity toEntity(){
    return GetUserEntity(
      email: email,
      fullName: fullName,
      imageUrl: imageUrl
    );
  }
}