import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/auth/getUser.dart';
import 'package:spotify/presentation/profile/bloc/profile_state.dart';
import 'package:spotify/service_locator.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileLoading());
  Future<void> getUser() async{
    var user=await sl<GetUseruseCase>().call();
    user.fold((l) {
      emit(ProfileFailure());
    }, (userEntity) {
      emit(
        ProfileLoaded(userEntity: userEntity)
      );
    });
  }
  
}