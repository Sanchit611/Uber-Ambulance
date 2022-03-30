import '../flutter_material/flutter_material_place_picker.dart';
import '../flutter_material/flutter_material_theme.dart';
import '../flutter_material/flutter_material_util.dart';
import '../flutter_material/flutter_material_widgets.dart';
import '../flutter_material/place.dart';
import '../main.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key key}) : super(key: key);

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  var placePickerValue = FFPlace();
  final formKey1 = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: flutterMaterialTheme.of(context).customColor1,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarPage(initialPage: 'HomePage'),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 50,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 60, 24, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Add Ambulance',
                  style: flutterMaterialTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        fontSize: 30,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 8, 0),
            child: Icon(
              Icons.account_box,
              color: Colors.black,
              size: 175,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          Form(
                            key: formKey1,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: textController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Enter Ambulance Registration  Number',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                ),
                                style: flutterMaterialTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                          Form(
                            key: formKey2,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                              child: TextFormField(
                                controller: textController2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter Ambulance Model Name',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                ),
                                style: flutterMaterialTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                            child: TextFormField(
                              controller: textController3,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter Phone Number',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                              ),
                              style: flutterMaterialTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                            child: flutterMaterialPlacePicker(
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
                                width: 200,
                                height: 40,
                                color: flutterMaterialTheme.of(context).grayLight,
                                textStyle: flutterMaterialTheme.of(context)
                                    .subtitle2
                                    .override(
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
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(40, 50, 40, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'HomePage'),
                                  ),
                                );
                              },
                              text: 'SUBMIT',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: Color(0xFF2B343A),
                                textStyle: flutterMaterialTheme.of(context)
                                    .subtitle2
                                    .override(
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
                          ),
                        ],
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
  }
}
