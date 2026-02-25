class PlaceSearch{
  String displayName;
  double latitude;
  double longitude;
  int osmId;
  PlaceSearch({required this.displayName, required this.latitude, required this.longitude, required this.osmId});

  @override
  String toString() {
    return 'PlaceSearch(displayName: $displayName, latitude: $latitude, longitude: $longitude, osmId: $osmId)';
  }

}