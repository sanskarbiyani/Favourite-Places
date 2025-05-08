import 'package:flutter/material.dart';

import '../models/places.dart';
import '../screens/favourite_place.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No places added here",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "Add a place to start",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, ind) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            title: Text(
              places[ind].name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => FavouritePlace(favplace: places[ind]),
                ),
              );
            },
          );
        },
      );
    }

    return content;
  }
}
