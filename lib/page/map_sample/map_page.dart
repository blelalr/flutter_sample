import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/page/theme_sample/theme_switch_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _controller;
  bool isMapCreated = false;
  late ThemeCubit themeBloc;
  final LatLng _center = const LatLng(25.032969, 121.565414);

  changeMapMode(bool isDarkMode) {
    if (isDarkMode) {
      getJsonFile('assets/map/dark_style.json').then(setMapStyle);
    } else {
      setMapStyle('[]');
    }
  }

  Future<String> getJsonFile(String path) async {
    return await DefaultAssetBundle.of(context).loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    themeBloc = context.watch<ThemeCubit>();
    if (isMapCreated) {
      changeMapMode(themeBloc.isDarkMode);
    }
    return Scaffold(
        appBar: AppBar(
          actions: [ThemeSwitchWidget()],
        ),
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            isMapCreated = true;
            changeMapMode(themeBloc.isDarkMode);
          },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
        ));
  }
}
