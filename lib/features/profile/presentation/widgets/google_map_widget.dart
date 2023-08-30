import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:location/location.dart' as LL;

class GoogleMapWidget extends StatefulWidget {
  final TextEditingController addressController;
  final LatLng currentLocation;
  const GoogleMapWidget({
    super.key,
    required this.addressController,
    required this.currentLocation,
  });

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  // on below line we have specified camera position
  bool openMap = false;

  final Completer<GoogleMapController> googleController =
      Completer<GoogleMapController>();
  late LatLng currentLocation;
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(51.50, 0.127),
    zoom: 14.4746,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentLocation = widget.currentLocation;

    CameraPosition cameraPosition = CameraPosition(
      target: widget.currentLocation,
      zoom: 14,
    );
    Future.delayed(Duration.zero, () async {
      final GoogleMapController controller = await googleController.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
    if (widget.addressController.text.isNotEmpty) {
      searchAddress(widget.addressController.text);
    }
  }

  @override
  void dispose() {
    // Dispose of the map controller when the widget is disposed
    try {
      googleController.future.then((controller) {
        // controller.dispose();
      });
    } catch (e) {
      print(e);
    }

    super.dispose();
  }

  void searchAddress(String address) async {
    if (mounted) {
      try {
        final api = GoogleGeocodingApi(
            "AIzaSyDvwIEcRlC_KgvbiWh8eZvXlUB0YcP2bVA",
            isLogged: true);
        final searchResults = await api.search(
          address,
          language: 'en',
        );
        if (searchResults.results.isNotEmpty) {
          final firstResult = searchResults.results.first;
          final location = firstResult.geometry?.location;
          if (location != null) {
            final latitude = location.lat ?? 0;
            final longitude = location.lng ?? 0;

            _markers.add(Marker(
              markerId: const MarkerId("2"),
              position: LatLng(latitude, longitude),
              infoWindow: const InfoWindow(
                title: 'Searched Location',
              ),
            ));

            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 14,
            );

            final GoogleMapController controller =
                await googleController.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          }
        }
      } on Exception catch (e) {
        print("Error searching address: $e");
      }
    }
  }

  Future<LL.LocationData> getUserCurrentLocation() async {
    try {
      LL.Location location = LL.Location();

      bool serviceEnabled;
      LL.PermissionStatus permissionGranted;
      LL.LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          // return LocationData;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == LL.PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != LL.PermissionStatus.granted) {
          // return;
        }
      }

      locationData = await location.getLocation();
      return locationData;
    } catch (e) {
      Map<String, dynamic> dataMap = {
        "latitude": 37.7749,
        "longitude": -122.4194,
        "accuracy": 16.0,
        "altitude": 0.0,
        "speed": 0.0,
        "speed_accuracy": 0.0,
        "heading": 0.0,
        "time": 1679467315000,
        "is_mock": false,
      };
      return LL.LocationData.fromMap(dataMap);
    }
  }

  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        openMap
            ? TextField(
                controller: widget.addressController,
                decoration: InputDecoration(
                  labelText: 'Search Address',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      searchAddress(widget.addressController.text);
                    },
                  ),
                ),
              )
            : const SizedBox(),
        openMap
            ? SizedBox(
                height: 200,
                child: GoogleMap(
                  initialCameraPosition: _kGoogle,
                  markers: Set<Marker>.of(_markers),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    googleController.complete(controller);
                    searchAddress(widget.addressController.text);
                  },
                  onTap: (LatLng latLng) async {
                    _markers.add(Marker(
                      markerId: const MarkerId("2"),
                      position: LatLng(latLng.latitude, latLng.longitude),
                      infoWindow: const InfoWindow(
                        title: 'My Location',
                      ),
                    ));

                    final api = GoogleGeocodingApi(AppConstants.googleMapApiKey,
                        isLogged: true);
                    final reversedSearchResults = await api.reverse(
                      '${latLng.latitude},${latLng.longitude}',
                      language: 'en',
                    );
                    if (reversedSearchResults.results.isNotEmpty) {
                      final firstResult = reversedSearchResults.results.first;
                      final formattedAddress = firstResult.formattedAddress;
                      setState(() {
                        widget.addressController.text = formattedAddress;
                      });
                    }
                  },
                ),
              )
            : const SizedBox(),
        TextButton(
            onPressed: () {
              setState(() {
                openMap = !openMap;
              });
            },
            child: Text(openMap ? "Close Map" : "Open Map")),
        TextButton(
          onPressed: () async {
            try {
              getUserCurrentLocation().then((value) async {
                _markers.add(Marker(
                  markerId: const MarkerId("2"),
                  position: LatLng(value.latitude ?? 0, value.longitude ?? 0),
                  infoWindow: const InfoWindow(
                    title: 'My Current Location',
                  ),
                ));
                CameraPosition cameraPosition = CameraPosition(
                  target: LatLng(value.latitude ?? 0, value.longitude ?? 0),
                  zoom: 14,
                );

                final GoogleMapController controller =
                    await googleController.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));

                final api = GoogleGeocodingApi(AppConstants.googleMapApiKey,
                    isLogged: true);
                final reversedSearchResults = await api.reverse(
                  '${value.latitude},${value.longitude}',
                  language: 'en',
                );
                if (reversedSearchResults.results.isNotEmpty) {
                  final firstResult = reversedSearchResults.results.first;
                  final formattedAddress = firstResult.formattedAddress;
                  setState(() {
                    widget.addressController.text = formattedAddress;
                  });
                }
              });
            } on Exception catch (e) {
              print("e$e");
            }
          },
          child: const Text("Get my location"),
        )
      ],
    );
  }
}
