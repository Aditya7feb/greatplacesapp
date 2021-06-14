import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import './add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaces.routeName);
                })
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlaces>(
                      child: Center(
                        child: const Text("No Places"),
                      ),
                      builder: (context, greatPlaces, ch) =>
                          greatPlaces.items.length <= 0
                              ? ch
                              : ListView.builder(
                                  itemCount: greatPlaces.items.length,
                                  itemBuilder: (context, index) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: FileImage(
                                        greatPlaces.items[index].image,
                                      ),
                                    ),
                                    title: Text(greatPlaces.items[index].title),
                                    onTap: () {},
                                  ),
                                ),
                    ),
        ));
  }
}
