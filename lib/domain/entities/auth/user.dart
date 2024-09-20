class UserEntity{
String? userId;
String? fullName;
String? email;
UserEntity({
  this.email,
  this.fullName,
  this.userId
});
}

class GetUserEntity{
String? imageUrl;
String? fullName;
String? email;
GetUserEntity({
  this.email,
  this.fullName,
  this.imageUrl
});
}