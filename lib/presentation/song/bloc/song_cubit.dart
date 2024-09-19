import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/presentation/song/bloc/song_state.dart';

class SongCubit extends Cubit<SongState> {

  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongCubit() : super(SongLoading()) {

    audioPlayer.positionStream.listen((position) { 
      songPosition = position;
      updateSongPlayer();
    });

    audioPlayer.durationStream.listen((duration) { 
      songDuration = duration!;
    });
  }

  void updateSongPlayer() {
    emit(
      Songloaded()
    );
  }


  Future<void> loadSong(String url) async{
    print(url);
    try {
      await audioPlayer.setUrl(url);
      emit(
        Songloaded()
      );
    } catch(e){
      emit(
        SongLoadFailure()
      );
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(
      Songloaded()
    );
  }
  
  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}