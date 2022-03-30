import '../backend/backend.dart';
import '../flutter_material/flutter_material_google_map.dart';
import '../flutter_material/flutter_material_icon_button.dart';
import '../flutter_material/flutter_material_theme.dart';
import '../flutter_material/flutter_material_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackCarWidget extends StatefulWidget {
  const TrackCarWidget({Key key}) : super(key: key);

  @override
  _TrackCarWidgetState createState() => _TrackCarWidgetState();
}

class _TrackCarWidgetState extends State<TrackCarWidget> {
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductNameRecord>>(
      stream: queryProductNameRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCubeGrid(
                color: flutterMaterialTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<ProductNameRecord> trackCarProductNameRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final trackCarProductNameRecord =
            trackCarProductNameRecordList.isNotEmpty
                ? trackCarProductNameRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: flutterMaterialGoogleMap(
                      controller: googleMapsController,
                      onCameraIdle: (latLng) => googleMapsCenter = latLng,
                      initialLocation: googleMapsCenter ??=
                          trackCarProductNameRecord.productLocation,
                      markers: [
                        if (trackCarProductNameRecord != null)
                          flutterMaterialMarker(
                            trackCarProductNameRecord.reference.path,
                            trackCarProductNameRecord.productLocation,
                          ),
                      ],
                      markerColor: GoogleMarkerColor.violet,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 14,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: false,
                      showLocation: true,
                      showCompass: false,
                      showMapToolbar: false,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: flutterMaterialTheme.of(context).dark400,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: flutterMaterialIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        buttonSize: 46,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: flutterMaterialTheme.of(context).customColor1,
                          size: 20,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.96,
                          height: 200,
                          decoration: BoxDecoration(
                            color: flutterMaterialTheme.of(context).customColor1,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sanchit Narang',
                                  style: flutterMaterialTheme.of(context).subtitle1,
                                ),
                                Divider(
                                  height: 3,
                                  thickness: 1,
                                  color:
                                      flutterMaterialTheme.of(context).grayLighter,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
