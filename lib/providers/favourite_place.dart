import 'package:favourite_places/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritePlaceNotifier extends StateNotifier<List<Place>> {
  FavouritePlaceNotifier() : super(const []);

  void addFavPlace(Place place) {
    state = [place, ...state];
  }

  void removeFavPlace(Place place) {
    state = state.where((element) => element.name != place.name).toList();
  }
}

final favouritePlaceProvider =
    StateNotifierProvider<FavouritePlaceNotifier, List<Place>>(
      (ref) => FavouritePlaceNotifier(),
    );
