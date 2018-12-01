import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:map_view/map_view.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';
import '../helpers/ensure_visible.dart';
import '../../models/location_data.dart';
import '../../models/product.dart';

class LocationInput extends StatefulWidget {
  final Function setLocation;
  final Product product;

  LocationInput(this.setLocation, this.product);

  @override
  State<StatefulWidget> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  final FocusNode _addressInputFocusNode = FocusNode();
  final TextEditingController _addressInputController = TextEditingController();
  Uri _staticMapUri;
  LocationData _locationData;

  @override
  void initState() {
    _addressInputFocusNode.addListener(_updateLocation);
    if(widget.product != null) {
      getStaticMap(widget.product.locationData.address);
    }
    super.initState();
  }

  @override
  void dispose() {
    _addressInputFocusNode.removeListener(_updateLocation);
    super.dispose();
  }

  void getStaticMap(String address) async {
    if (address.isEmpty) {
      setState(() {
        _staticMapUri = null;
      });
      widget.setLocation(null);
      return;
    }

    if(widget.product == null) {
      final Uri uri = Uri.https(
        'maps.googleapis.com',
        '/maps/api/geocode/json',
        {'address': address, 'key': CONFIGURATIONS.googleAPIKey},
      );

      final http.Response response = await http.get(uri);
      final decodedResponse = json.decode(response.body);
      final formattedAddress = decodedResponse['results'][0]['formatted_address'];
      final coords = decodedResponse['results'][0]['geometry']['location'];
      _locationData = LocationData(
        address: formattedAddress,
        latitude: coords['lat'],
        longitude: coords['lng'],
      );
      widget.setLocation(_locationData);
    } else {
      _locationData = widget.product.locationData;
    }

    final StaticMapProvider staticMapViewProvider =
        StaticMapProvider(CONFIGURATIONS.googleAPIKey);
    final staticMapUri = staticMapViewProvider.getStaticUriWithMarkers(
      [Marker('position', 'Position', _locationData.latitude, _locationData.longitude)],
      center: Location(_locationData.latitude, _locationData.longitude),
      width: 500,
      height: 300,
      maptype: StaticMapViewType.roadmap,
    );
    setState(() {
      _addressInputController.text = _locationData.address;
      _staticMapUri = staticMapUri;
    });
  }

  void _updateLocation() {
    if (!_addressInputFocusNode.hasFocus) {
      getStaticMap(_addressInputController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EnsureVisibleWhenFocused(
          focusNode: _addressInputFocusNode,
          child: TextFormField(
            focusNode: _addressInputFocusNode,
            controller: _addressInputController,
            validator: (String value) {
              if(_locationData == null || value.isEmpty) {
                return 'No valid location found.'; 
              }
            },
            decoration: InputDecoration(labelText: 'Address'),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Image.network(_staticMapUri.toString())
      ],
    );
  }
}
