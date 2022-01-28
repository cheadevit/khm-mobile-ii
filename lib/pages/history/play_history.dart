import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/plugins/google_map_api.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PlayHistoryPage extends StatefulWidget {
  const PlayHistoryPage({Key? key}) : super(key: key);

  @override
  _PlayHistoryPageState createState() => _PlayHistoryPageState();
}

class _PlayHistoryPageState extends State<PlayHistoryPage> {
  DateRangePickerController _datePickerController = DateRangePickerController();
  LatLng sourceLocation = LatLng(28.432864, 77.002563);
  LatLng destinationLatlng = LatLng(28.431626, 77.002475);

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _marker = Set<Marker>();

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  late StreamSubscription<LocationData> subscription;

  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

  @override
  void initState() {
    super.initState();

    location = Location();
    polylinePoints = PolylinePoints();

    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;

      updatePinsOnMap();
    });

    setInitialLocation();
  }

  void setInitialLocation() async {
    await location.getLocation().then((value) {
      currentLocation = value;
      setState(() {});
    });

    destinationLocation = LocationData.fromMap({
      "latitude": destinationLatlng.latitude,
      "longitude": destinationLatlng.longitude,
    });
  }

  void showLocationPins() {
    var sourceposition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);
    print('sourceLocation');
    print(sourceLocation);

    var destinationPosition =
        LatLng(destinationLatlng.latitude, destinationLatlng.longitude);
    print(destinationPosition);
    _marker.add(Marker(
      markerId: MarkerId('sourcePosition'),
      position: sourceposition,
    ));

    _marker.add(
      Marker(
        markerId: MarkerId('destinationPosition'),
        position: destinationPosition,
      ),
    );

    setPolylinesInMap();
  }

  void setPolylinesInMap() async {
    var result = await polylinePoints.getRouteBetweenCoordinates(
      GoogleMapApi().url,
      PointLatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
      PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
    );
    print('result.points.isNotEmpty');
    print(result.points);

    if (result.points.isNotEmpty) {
      result.points.forEach((pointLatLng) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    setState(() {
      _polylines.add(Polyline(
        width: 5,
        polylineId: PolylineId('polyline'),
        color: Colors.blueAccent,
        points: polylineCoordinates,
      ));
    });
  }

  void updatePinsOnMap() async {
    CameraPosition cameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing: 30,
      target: LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    );

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    var sourcePosition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    setState(() {
      _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

      _marker.add(Marker(
        markerId: MarkerId('sourcePosition'),
        position: sourcePosition,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 30,
      tilt: 80,
      bearing: 30,
      target: currentLocation != null
          ? LatLng(currentLocation!.latitude ?? 0.0,
              currentLocation!.longitude ?? 0.0)
          : LatLng(0.0, 0.0),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Play History'),
        ),
        body: currentLocation == null
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                myLocationButtonEnabled: true,
                compassEnabled: true,
                markers: _marker,
                // polylines: _polylines,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  showLocationPins();
                },
              ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              elevation: 10.0,
              child: const Icon(Icons.calendar_today),
              onPressed: () => {
                _selectDateRange()
              },
            ),
            const SizedBox(height: 6),
            FloatingActionButton(
              elevation: 10.0,
              child: const Icon(Icons.directions),
              onPressed: () => {},
            ),
            const SizedBox(height: 6),
            FloatingActionButton(
              elevation: 10.0,
              child: const Icon(Icons.gps_fixed),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }

  Future _selectDateRange() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () => {},
        builder: (context) => Container(
          child: Column(
            children: [
              Container(
                child: Text("ddd"),
              ),
              Container(
                child: SfDateRangePicker(
                  // onSelectionChanged: _onSelectionChanged,
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.range,
                  showActionButtons: true,
                  controller: _datePickerController,
                  onCancel: () {
                    _datePickerController.selectedRanges = null;
                    Navigator.pop(context);
                  },
                  onSubmit: (Object? val) {
                    print(val);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          )
        )
      ),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
