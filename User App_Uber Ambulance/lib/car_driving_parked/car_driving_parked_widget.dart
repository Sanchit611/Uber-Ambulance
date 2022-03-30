import '../flutter_material/flutter_material_animations.dart';
import '../flutter_material/flutter_material_icon_button.dart';
import '../flutter_material/flutter_material_theme.dart';
import '../flutter_material/flutter_material_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CarDrivingParkedWidget extends StatefulWidget {
  const CarDrivingParkedWidget({Key key}) : super(key: key);

  @override
  _CarDrivingParkedWidgetState createState() => _CarDrivingParkedWidgetState();
}

class _CarDrivingParkedWidgetState extends State<CarDrivingParkedWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 39),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 51),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 51),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 58),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'stackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 78),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 29),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      backgroundColor: flutterMaterialTheme.of(context).tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 50, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Your Car',
                    style: flutterMaterialTheme.of(context).bodyText2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fleet Model 42',
                    style: flutterMaterialTheme.of(context).title1.override(
                          fontFamily: 'Lexend Deca',
                          color: flutterMaterialTheme.of(context).customColor1,
                        ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: flutterMaterialTheme.of(context).dark400,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: flutterMaterialIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      buttonSize: 46,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: flutterMaterialTheme.of(context).customColor1,
                        size: 24,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/carFull@2x.png',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ).animated([animationsMap['imageOnPageLoadAnimation']]),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  '0',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                    color: flutterMaterialTheme.of(context).customColor1,
                    fontWeight: FontWeight.w100,
                    fontSize: 92,
                  ),
                ).animated([animationsMap['textOnPageLoadAnimation']]),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'MPH',
                    textAlign: TextAlign.center,
                    style: flutterMaterialTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: flutterMaterialTheme.of(context).grayLight,
                        ),
                  ),
                ],
              ).animated([animationsMap['rowOnPageLoadAnimation1']]),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Battery Status',
                    textAlign: TextAlign.center,
                    style: flutterMaterialTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: flutterMaterialTheme.of(context).grayLight,
                        ),
                  ),
                ],
              ).animated([animationsMap['rowOnPageLoadAnimation2']]),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 20,
                      decoration: BoxDecoration(
                        color: flutterMaterialTheme.of(context).dark400,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 16,
                        decoration: BoxDecoration(
                          color: flutterMaterialTheme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).animated([animationsMap['rowOnPageLoadAnimation3']]),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                          'Charge',
                          style: flutterMaterialTheme.of(context).bodyText2,
                        ),
                      ),
                      Text(
                        '70%',
                        style: flutterMaterialTheme.of(context).title1.override(
                              fontFamily: 'Lexend Deca',
                              color: flutterMaterialTheme.of(context).customColor1,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Range',
                          style: flutterMaterialTheme.of(context).bodyText2,
                        ),
                      ),
                      Text(
                        '329m',
                        style: flutterMaterialTheme.of(context).title1.override(
                              fontFamily: 'Lexend Deca',
                              color: flutterMaterialTheme.of(context).customColor1,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Status',
                          style: flutterMaterialTheme.of(context).bodyText2,
                        ),
                      ),
                      Text(
                        'Good',
                        style: flutterMaterialTheme.of(context).title1.override(
                              fontFamily: 'Lexend Deca',
                              color: flutterMaterialTheme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                ],
              ).animated([animationsMap['rowOnPageLoadAnimation4']]),
            ),
            Container(
              height: 200,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          color: flutterMaterialTheme.of(context).dark400,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Car is Parked',
                                style: flutterMaterialTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: flutterMaterialTheme.of(context)
                                          .customColor1,
                                    ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 0),
                                  child: Text(
                                    'You can now turn your car off.',
                                    style: flutterMaterialTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xB3FFFFFF),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -0.75),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFE4002B),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Color(0x8E000000),
                            offset: Offset(0, 3),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.power_settings_new_rounded,
                        color: flutterMaterialTheme.of(context).customColor1,
                        size: 50,
                      ),
                    ).animated([animationsMap['containerOnPageLoadAnimation']]),
                  ),
                ],
              ),
            ).animated([animationsMap['stackOnPageLoadAnimation']]),
          ],
        ),
      ),
    );
  }
}
