abstract class FavoriteState{}
class FavoriteStateInitial extends FavoriteState{}
class FavoriteUpdated extends FavoriteState{
  final bool isFavorite;

  FavoriteUpdated({required this.isFavorite});
}