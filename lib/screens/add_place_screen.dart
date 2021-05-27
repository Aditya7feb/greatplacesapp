import 'package:flutter/material.dart';

import 'package:greatplacesapp/widgets/image_input.dart';

class AddPlaces extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlacesState createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final _titleController = TextEditingController();
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
                      ImageInput(),
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
              onPressed: () {},
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
