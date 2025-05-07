import 'package:favourite_places/providers/favourite_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/places.dart';

class AddFavouritePlaceScreen extends ConsumerWidget {
  AddFavouritePlaceScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  var _placeName = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Favourite Place')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 60,
                textCapitalization: TextCapitalization.sentences,
                initialValue: _placeName,
                decoration: const InputDecoration(label: Text("Place")),
                style: const TextStyle(color: Colors.white),
                onSaved: (newValue) {
                  _placeName = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid place name";
                  } else if (value.trim().length <= 3) {
                    return "Enter values greater than 3 characters";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref
                        .read(favouritePlaceProvider.notifier)
                        .addFavPlace(Place(name: _placeName));
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Add place"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
