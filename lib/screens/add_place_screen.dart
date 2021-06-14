import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplacesapp/providers/great_places.dart';
import 'package:provider/provider.dart';
import 'package:greatplacesapp/widgets/image_input.dart';

class AddPlaces extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlacesState createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final _titleController = TextEditingController();

  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Place"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: "Title"),
                        controller: _titleController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ImageInput(_selectImage),
                    ],
                  ),
                ),
              ),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                backgroundColor: ThemeData().primaryColor,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: _savePlace,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                "Add Place",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
