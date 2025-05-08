import 'package:favourite_places/providers/favourite_place.dart';
import 'package:favourite_places/screens/add_favourite_place.dart';
import 'package:favourite_places/widgets/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteListScreen extends ConsumerWidget {
  const FavouriteListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritePlaceList = ref.watch(favouritePlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => AddFavouritePlaceScreen()),
              );
            },
            icon: Container(
              margin: const EdgeInsets.only(right: 8),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
      body: PlaceList(places: favouritePlaceList),
    );
  }
}
