import '../car_driving/car_driving_widget.dart';
import '../flutter_material/flutter_material_animations.dart';
import '../flutter_material/flutter_material_drop_down.dart';
import '../flutter_material/flutter_material_icon_button.dart';
import '../flutter_material/flutter_material_place_picker.dart';
import '../flutter_material/flutter_material_theme.dart';
import '../flutter_material/flutter_material_util.dart';
import '../flutter_material/flutter_material_widgets.dart';
import '../flutter_material/place.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  String dropDownValue;
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(79, 0),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: flutterMaterialTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: flutterMaterialIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Book Ambulance',
          style: flutterMaterialTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: flutterMaterialTheme.of(context).background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Where from?',
                      style: flutterMaterialTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 28,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    flutterMaterialPlacePicker(
                      iOSGoogleMapsApiKey:
                          'AIzaSyBOxo048xg5mIXy8bj57dYwATqYAyi1hmk',
                      androidGoogleMapsApiKey:
                          'AIzaSyBgdN0CWQnd2XlcCYM8ALovYd7G4fVuHLs',
                      webGoogleMapsApiKey:
                          'AIzaSyDY3Ifo4DKFOIC3aJ54FbpdbHvFGvBWGPQ',
                      onSelect: (place) =>
                          setState(() => placePickerValue = place),
                      defaultText: 'Select Location',
                      icon: Icon(
                        Icons.place,
                        color: Colors.white,
                        size: 16,
                      ),
                      buttonOptions: FFButtonOptions(
                        width: 330,
                        height: 40,
                        color: flutterMaterialTheme.of(context).primaryColor,
                        textStyle:
                            flutterMaterialTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/ambulance_PNG28.png',
                width: MediaQuery.of(context).size.width * 0.7,
                height: 180,
                fit: BoxFit.contain,
              ).animated([animationsMap['imageOnPageLoadAnimation']]),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 5,
                          decoration: BoxDecoration(
                            color: flutterMaterialTheme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            'Uber Ambulance Services',
                            style: flutterMaterialTheme.of(context).bodyText2,
                          ),
                        ),
                        Text(
                          'Saving seconds to save lives',
                          style: flutterMaterialTheme.of(context).title1.override(
                                fontFamily: 'Lexend Deca',
                                color:
                                    flutterMaterialTheme.of(context).primaryColor,
                                fontSize: 23,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              flutterMaterialDropDown(
                options: [
                  'Basic Life Support',
                  'Advanced  Life Support',
                  'Emergency Life Support'
                ].toList(),
                onChanged: (val) => setState(() => dropDownValue = val),
                width: 220,
                height: 50,
                textStyle: flutterMaterialTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                    ),
                hintText: 'Select Ambulance Type',
                fillColor: Colors.white,
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 0,
                margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                hidesUnderline: true,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 150,
                      decoration: BoxDecoration(
                        color: flutterMaterialTheme.of(context).secondaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x37000000),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 250),
                              reverseDuration: Duration(milliseconds: 250),
                              child: CarDrivingWidget(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.solidArrowAltCircleRight,
                                color:
                                    flutterMaterialTheme.of(context).customColor1,
                                size: 44,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: AutoSizeText(
                                'Book Now',
                                textAlign: TextAlign.center,
                                style: flutterMaterialTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: flutterMaterialTheme.of(context)
                                          .customColor1,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                child: Text(
                                  'Tap here to book ambulance now',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Lexend Deca',
                                    color: Color(0xB3FFFFFF),
                                    fontSize: 12,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
