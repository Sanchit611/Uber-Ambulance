import '../flutter_material/flutter_material_checkbox_group.dart';
import '../flutter_material/flutter_material_icon_button.dart';
import '../flutter_material/flutter_material_theme.dart';
import '../flutter_material/flutter_material_util.dart';
import '../flutter_material/flutter_material_widgets.dart';
import '../main.dart';
import '../track_car/track_car_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key key}) : super(key: key);

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  List<String> checkboxGroupValues;
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          'Booking Confirmed',
          style: flutterMaterialTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarPage(initialPage: 'profilePage'),
                ),
              );
            },
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 50,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: flutterMaterialTheme.of(context).customColor1,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Ambulance is on the way...',
                                          textAlign: TextAlign.center,
                                          style: flutterMaterialTheme.of(context)
                                              .title2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      33, 0, 43, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TrackCarWidget(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Track your ambulance',
                                            textAlign: TextAlign.center,
                                            style: flutterMaterialTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: Image.asset(
                                        'assets/images/ambulance-quot-touch-truck-quot-community-event-temecula-education-16.png',
                                        width: 350,
                                        height: 300,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                                flutterMaterialCheckboxGroup(
                                  initiallySelected: checkboxGroupValues != null
                                      ? checkboxGroupValues
                                      : [
                                          'Driver Alloted',
                                          'Fully Sanitised Ambulance'
                                        ],
                                  options: [
                                    'Driver Alloted',
                                    'Fully Sanitised Ambulance'
                                  ],
                                  onChanged: (val) =>
                                      setState(() => checkboxGroupValues = val),
                                  activeColor:
                                      flutterMaterialTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      flutterMaterialTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: Image.asset(
                                        'assets/images/fleetCar_2@3x.png',
                                        width: 300,
                                        height: 300,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Full Control',
                                          textAlign: TextAlign.center,
                                          style: flutterMaterialTheme.of(context)
                                              .title2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32, 0, 32, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Always have control over your car, prestart it, review battery life, temp and range.',
                                          textAlign: TextAlign.center,
                                          style: flutterMaterialTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 30),
                                      child: Image.asset(
                                        'assets/images/fleetCar_3@3x.png',
                                        width: 300,
                                        height: 250,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Never Lose Your Car',
                                          textAlign: TextAlign.center,
                                          style: flutterMaterialTheme.of(context)
                                              .title2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Always track your car with integrated GPS, sharing rides has never been easier.',
                                          textAlign: TextAlign.center,
                                          style: flutterMaterialTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    flutterMaterialTheme.of(context)
                                                        .grayLight,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: SmoothPageIndicator(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 4,
                              dotColor: Color(0x8AC6CAD4),
                              activeDotColor:
                                  flutterMaterialTheme.of(context).grayLight,
                              paintStyle: PaintingStyle.fill,
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
          Text(
            '  HR 02 RW 1845\n  Force Traveller',
            style: flutterMaterialTheme.of(context).bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  fontSize: 18,
                ),
          ),
          FaIcon(
            FontAwesomeIcons.phoneAlt,
            color: Colors.black,
            size: 30,
          ),
          Text(
            'Call Driver : Om Prakash\n             +2409157',
            style: flutterMaterialTheme.of(context).bodyText1,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'payments'),
                          ),
                        );
                      },
                      text: 'Complete Payment',
                      options: FFButtonOptions(
                        width: 200,
                        height: 50,
                        color: flutterMaterialTheme.of(context).background,
                        textStyle:
                            flutterMaterialTheme.of(context).subtitle1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF39D2C0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
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
