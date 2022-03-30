import '../backend/backend.dart';
import '../flutter_material/flutter_material_animations.dart';
import '../flutter_material/flutter_material_theme.dart';
import '../flutter_material/flutter_material_util.dart';
import '../flutter_material/flutter_material_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditCarWidget extends StatefulWidget {
  const EditCarWidget({
    Key key,
    this.carDetails,
  }) : super(key: key);

  final DocumentReference carDetails;

  @override
  _EditCarWidgetState createState() => _EditCarWidgetState();
}

class _EditCarWidgetState extends State<EditCarWidget>
    with TickerProviderStateMixin {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    textController1 = TextEditingController(text: '      Force Traveller');
    textController2 = TextEditingController(text: '      Emergency');
    textController3 = TextEditingController(text: '      HR 26 DQ 1248');
    textController4 = TextEditingController(text: '      Om Prakash');
    textController5 = TextEditingController(text: '      9650896715');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductNameRecord>(
      stream: ProductNameRecord.getDocument(widget.carDetails),
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
        final editCarProductNameRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Text(
              'Emergency Care Support',
              style: flutterMaterialTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF14181B),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: StreamBuilder<List<ProductNameRecord>>(
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
                List<ProductNameRecord> columnProductNameRecordList =
                    snapshot.data;
                // Return an empty Container when the document does not exist.
                if (snapshot.data.isEmpty) {
                  return Container();
                }
                final columnProductNameRecord =
                    columnProductNameRecordList.isNotEmpty
                        ? columnProductNameRecordList.first
                        : null;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/ambulance-quot-touch-truck-quot-community-event-temecula-education-16.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 200,
                            fit: BoxFit.contain,
                          ).animated(
                              [animationsMap['imageOnPageLoadAnimation']]),
                        ],
                      ),
                      TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '        Ambulance Details',
                          hintText: '[Some hint text...]',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: flutterMaterialTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 19,
                            ),
                      ),
                      TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '        Ambulance Type',
                          hintText: '[Some hint text...]',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: flutterMaterialTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 19,
                            ),
                      ),
                      TextFormField(
                        controller: textController3,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '        Ambulance Number',
                          hintText: '[Some hint text...]',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: flutterMaterialTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 19,
                            ),
                      ),
                      TextFormField(
                        controller: textController4,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '        Driver Name',
                          hintText: '[Some hint text...]',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: flutterMaterialTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 19,
                            ),
                      ),
                      TextFormField(
                        controller: textController5,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '        Call Driver',
                          hintText: '[Some hint text...]',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: flutterMaterialTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 19,
                            ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0.05),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 40),
                          child: StreamBuilder<List<ProductNameRecord>>(
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
                                      color: flutterMaterialTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<ProductNameRecord>
                                  buttonProductNameRecordList = snapshot.data;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data.isEmpty) {
                                return Container();
                              }
                              final buttonProductNameRecord =
                                  buttonProductNameRecordList.isNotEmpty
                                      ? buttonProductNameRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavBarPage(
                                          initialPage: 'profilePage'),
                                    ),
                                  );
                                },
                                text: 'Go Back',
                                options: FFButtonOptions(
                                  width: 230,
                                  height: 50,
                                  color: Color(0xFF39D2C0),
                                  textStyle: flutterMaterialTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 30,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
