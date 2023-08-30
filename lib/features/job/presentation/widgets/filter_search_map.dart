import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/widgets/single_job.dart';
import 'package:location/location.dart' as LL;
import 'package:location/location.dart';

class FilterSearchMap extends StatefulHookWidget {
  final List<JobModel> jobs;
  const FilterSearchMap({Key? key, required this.jobs}) : super(key: key);

  @override
  _FilterSearchMapState createState() => _FilterSearchMapState();
}

class _FilterSearchMapState extends State<FilterSearchMap> {
  bool loading = true;
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(51.50, 0.127),
    zoom: 14.4746,
  );
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
  late LocationData localVal;
  late Completer<GoogleMapController> newController;
  List<Marker> markers = [];
  double _currentSliderValue = 95000;

  late LL.LocationData myLocation;
  JobModel? selectedjob;
  Set<Circle> circles = {};
  bool isMarkerInsideCircle(LatLng markerPosition) {
    double distance = calculateDistance(
        LatLng(localVal.latitude ?? 0, localVal.longitude ?? 0),
        markerPosition);
    return distance <= _currentSliderValue;
  }

  double calculateDistance(LatLng p1, LatLng p2) {
    // Haversine formula to calculate the distance between two points
    double lat1 = p1.latitude;
    double lon1 = p1.longitude;
    double lat2 = p2.latitude;
    double lon2 = p2.longitude;

    double dLat = (lat2 - lat1) * (pi / 180.0);
    double dLon = (lon2 - lon1) * (pi / 180.0);

    double a = pow(sin(dLat / 2), 2) +
        cos(lat1 * (pi / 180.0)) *
            cos(lat2 * (pi / 180.0)) *
            pow(sin(dLon / 2), 2);
    double c = 2 * asin(sqrt(a));
    double radius = 6371000; // Earth's radius in meters
    return radius * c;
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

  @override
  initState() {
    super.initState();
    localVal = LocationData.fromMap(dataMap);
    getUserCurrentLocation().then((value) async {
      // markers.add(Marker(
      //   markerId: const MarkerId("2"),
      //   position: LatLng(value.latitude ?? 0, value.longitude ?? 0),
      // ));
      localVal = value;
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude ?? 0, value.longitude ?? 0),
        zoom: 14,
      );

      final GoogleMapController controller = await newController.future;
      setState(() {
        circles = {
          Circle(
            circleId: const CircleId("MY"),
            center: LatLng(value.latitude ?? 0, value.longitude ?? 0),
            radius: _currentSliderValue,
            strokeColor: Colors.blue,
            strokeWidth: 2,
            fillColor: Colors.blue.withOpacity(0.3),
          )
        };
      });
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> generateMarkers(List<JobModel> jobs) {
      List<Marker> markerList = [];
      for (var i = 0; i < jobs.length; i++) {
        var job = jobs[i];
        markerList.add(Marker(
            markerId: MarkerId(job.id ?? ""),
            position: LatLng(job.contractor!.location!.coordinates![0] ?? 0,
                job.contractor!.location!.coordinates![1] ?? 0),
            // infoWindow: const InfoWindow(
            //   title: 'My Current Location',
            // ),
            onTap: () {
              setState(() {
                selectedjob = job;
              });
            }));
      }
      return markerList;
    }

    useEffect(() {
      // mapController = Completer();
      newController = Completer<GoogleMapController>();

      markers = generateMarkers(widget.jobs);
      setState(() {});

      return null;
    }, [widget.jobs]);

    // useEffect(() {
    //   setState(() {
    //     circles = {
    //       Circle(
    //         circleId: const CircleId("MY"),
    //         center: LatLng(localVal.latitude ?? 0, localVal.longitude ?? 0),
    //         radius: _currentSliderValue,
    //         strokeColor: Colors.blue,
    //         strokeWidth: 2,
    //         fillColor: Colors.blue.withOpacity(0.3),
    //       )
    //     };
    //   });
    //   return null;
    // }, [_currentSliderValue, localVal]);

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGoogle,
          // markers: Set<Marker>.of(markers),
          markers: markers
              .where((marker) => isMarkerInsideCircle(marker.position))
              .toSet(),
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          circles: circles,
          onMapCreated: (GoogleMapController controller) {
            newController.complete(controller);
            loading = false;
            setState(() {});
          },
          onTap: (LatLng latLng) async {},
        ),
        selectedjob == null
            ? const SizedBox()
            : Positioned(
                top: 300,
                left: 0,
                right: 0,
                child: CustomCardWidget(
                  children: Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                selectedjob = null;
                                setState(() {});
                              },
                              child: const Icon(Icons.close),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        key: Key(selectedjob!.id ?? ""),
                        child: SingleJob(job: selectedjob!),
                      )
                    ]),
                  ),
                )),
        Positioned(
          top: 0,
          child: Row(
            children: [
              Text("Range: $_currentSliderValue"),
              Slider(
                value: _currentSliderValue,
                max: 95000,
                divisions: 1000,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    circles = {
                      Circle(
                        circleId: const CircleId("MY"),
                        center: LatLng(
                            localVal.latitude ?? 0, localVal.longitude ?? 0),
                        radius: value,
                        strokeColor: Colors.blue,
                        strokeWidth: 2,
                        fillColor: Colors.blue.withOpacity(0.3),
                      )
                    };
                  });
                },
              ),
            ],
          ),
        ),
        loading
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.1),
                child: const SizedBox(
                    width: 60, height: 60, child: CircularProgressIndicator()),
              )
            : const SizedBox()
      ],
    );
  }
}
