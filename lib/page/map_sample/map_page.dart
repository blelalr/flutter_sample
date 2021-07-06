import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/global_page_view/global_page_view_cubit.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/custom_widget/icon_button_default.dart';
import 'package:flutter_sample/custom_widget/switch_theme_widget.dart';
import 'package:flutter_sample/page/map_sample/cluster_item.dart';
import 'package:flutter_sample/page/map_sample/place.dart';
import 'package:flutter_sample/page/test_sample/global_page_view.dart';
import 'package:flutter_sample/style/app_colors.dart';
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
    return BlocProvider(
      create: (context) => GlobalPageViewCubit()..fetchGlobalList(),
      child: Material(
        child: Stack(children: [
          Positioned.fill(
              child: Container(
            child: GoogleMap(
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                isMapCreated = true;
                changeMapMode(themeBloc.isDarkMode);
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            ),
          )),
          Positioned.fill(
            child: Container(
                decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [
                    0,
                    0.2,
                    0.7,
                    1
                  ],
                  colors: [
                    AppColors.maskGradientBlack20,
                    Colors.transparent,
                    Colors.transparent,
                    AppColors.maskGradientBlack20
                  ]),
            )),
          ),
          Positioned.fill(
            child: Container(
                decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [
                    0,
                    0.2,
                    0.7,
                    1
                  ],
                  colors: [
                    AppColors.maskGradientWhite20,
                    Colors.transparent,
                    Colors.transparent,
                    AppColors.maskGradientWhite20
                  ]),
            )),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 42,
            child: Column(children: [
              GlobalPageView(),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: themeBloc.isDarkMode
                      ? AppColors.glassIos_20blurDark
                      : AppColors.glassIos_20blurLight,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.line83,
                    width: 1,
                  ),
                ),
                width: 228,
                height: 56,
                child: Row(
                  children: [
                    Expanded(
                        child: IconButtonDefault(
                            iconPath: 'assets/icon/home_f_big.svg')),
                    Expanded(
                        child: IconButtonDefault(
                            iconPath: 'assets/icon/camera_big.svg')),
                    Expanded(
                        child: IconButtonDefault(
                            iconPath: 'assets/icon/us_s_big.svg'))
                  ],
                ),
              )
            ]),
          ),
          Positioned(
              left: 0.0,
              top: 0.0,
              child:
                  Container(width: 50, height: 50, child: SwitchThemeWidget())),
          Positioned(
              right: 16,
              bottom: 52,
              child: Container(color: Colors.yellow, width: 36, height: 36)),
        ]),
      ),
    );
  }
}
