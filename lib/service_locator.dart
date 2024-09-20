import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase.dart';
import 'package:spotify/data/sources/song/song.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/getUser.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_fav.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/is_fav_song.dart';

import 'domain/repository/song/song.dart';
import 'domain/usecases/auth/signin.dart';
import 'domain/usecases/song/get_playList.dart';

final sl=GetIt.instance;
Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRespositoryImpl()
  );
   sl.registerSingleton<SignupuseCase>(
  SignupuseCase()
 );
 sl.registerSingleton<SigninUseCase>(
  SigninUseCase()
 );
//  songs
sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl()
  );

  sl.registerSingleton<SongsRepository>(
    SongsRepositoryImpl()
  );
  sl.registerSingleton<GetNewsSongsUseCase>(
  GetNewsSongsUseCase()
 );
 sl.registerSingleton<GetPlayListUseCase>(
  GetPlayListUseCase()
 );
 sl.registerSingleton<AddOrRemoveFavUseCase>(
  AddOrRemoveFavUseCase()
 );
 sl.registerSingleton<IsFavoriteSongUseCase>(
  IsFavoriteSongUseCase()
 );
 sl.registerSingleton<GetUseruseCase>(
  GetUseruseCase()
 );
}