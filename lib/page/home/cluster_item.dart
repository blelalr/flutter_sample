import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'geohash.dart';

class ClusterItem<T> {
  final LatLng location;
  final String geohash;
  final T? item;

  ClusterItem(this.location, {this.item})
      : geohash = Geohash.encode(location.latitude, location.longitude,
            codeLength: 20);
}
