import 'package:favourite_places/models/places.dart';
import 'package:flutter/material.dart';

class FavouritePlace extends StatelessWidget {
  final Place favplace;

  const FavouritePlace({super.key, required this.favplace});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(favplace.name)),
      body: Center(child: Text(favplace.name)),
    );
  }
}
