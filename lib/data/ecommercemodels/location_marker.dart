class LocationMarker{
  double latitude;
  double longitude;
  List<double> boundingBoxes;
  String displayLocationName;

  LocationMarker({required this.latitude, required this.longitude, required this.boundingBoxes, required this.displayLocationName});

  @override
  String toString() {
    return 'LocationMarker(latitude: $latitude, longitude: $longitude, boundingBoxes: $boundingBoxes)';
  }

}