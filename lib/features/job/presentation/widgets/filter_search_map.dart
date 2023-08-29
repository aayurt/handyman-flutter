import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/widgets/single_job.dart';
import 'package:location/location.dart' as LL;

class FilterSearchMap extends StatefulHookWidget {
  final List<JobModel> jobs;
  const FilterSearchMap({Key? key, required this.jobs}) : super(key: key);

  @override
  _FilterSearchMapState createState() => _FilterSearchMapState();
}

class _FilterSearchMapState extends State<FilterSearchMap> {
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(51.50, 0.127),
    zoom: 14.4746,
  );
  late Completer<GoogleMapController> newController;
  List<Marker> markers = [];
  late LL.LocationData myLocation;
  JobModel? selectedjob;
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
    getUserCurrentLocation().then((value) async {
      // markers.add(Marker(
      //   markerId: const MarkerId("2"),
      //   position: LatLng(value.latitude ?? 0, value.longitude ?? 0),
      // ));
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude ?? 0, value.longitude ?? 0),
        zoom: 14,
      );

      final GoogleMapController controller = await newController.future;
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
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGoogle,
          markers: Set<Marker>.of(markers),
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            newController.complete(controller);
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
                ))
      ],
    );
  }
}
