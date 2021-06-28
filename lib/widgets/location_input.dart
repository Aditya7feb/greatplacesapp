import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    print("Hello");
    final locData = await Location().getLocation();
    final staticMap = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    print(locData.latitude);
    print(locData.longitude);
    setState(() {
      _previewImageUrl = staticMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: _previewImageUrl == null
              ? Text(
                  "No Location Choosen",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () => _getCurrentUserLocation(),
              icon: Icon(Icons.location_on_outlined),
              label: Text(
                "Current Location",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              style: TextButton.styleFrom(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            TextButton.icon(
                style: TextButton.styleFrom(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  print("Helw");
                },
                icon: Icon(Icons.map_outlined),
                label: Text(
                  "Select On Map",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ))
          ],
        )
      ],
    );
  }
}
