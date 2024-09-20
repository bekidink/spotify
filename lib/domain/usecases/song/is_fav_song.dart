import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class IsFavoriteSongUseCase implements UseCase<bool,String>{
  @override
  Future<bool> call({String ?params}) async {
    return await sl<SongsRepository>().isFavoriteSong(params!);
  }
  
}