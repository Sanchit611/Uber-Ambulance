import '../flutter_material/flutter_material_icon_button.dart';
import '../flutter_material/flutter_material_theme.dart';
import '../flutter_material/flutter_material_util.dart';
import '../flutter_material/flutter_material_widgets.dart';
import '../main.dart';
import '../past_payment/past_payment_widget.dart';
import '../track_car/track_car_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCompleteWidget extends StatefulWidget {
  const PaymentCompleteWidget({Key key}) : super(key: key);

  @override
  _PaymentCompleteWidgetState createState() => _PaymentCompleteWidgetState();
}

class _PaymentCompleteWidgetState extends State<PaymentCompleteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: flutterMaterialTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
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
                        Icons.close_rounded,
                        color: flutterMaterialTheme.of(context).customColor1,
                        size: 20,
                      ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 240),
                            reverseDuration: Duration(milliseconds: 240),
                            child: NavBarPage(initialPage: 'profilePage'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: flutterMaterialTheme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                  child: Icon(
                    Icons.check_rounded,
                    color: flutterMaterialTheme.of(context).customColor1,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                'Payment Confirmed!',
                style: flutterMaterialTheme.of(context).title1.override(
                      fontFamily: 'Lexend Deca',
                      color: flutterMaterialTheme.of(context).customColor1,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                '1200 INR',
                style: GoogleFonts.getFont(
                  'Overpass',
                  color: flutterMaterialTheme.of(context).customColor1,
                  fontWeight: FontWeight.w100,
                  fontSize: 72,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
              child: Text(
                'Your payment has been confirmed',
                textAlign: TextAlign.center,
                style: flutterMaterialTheme.of(context).bodyText2,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PastPaymentWidget(),
                          ),
                        );
                      },
                      text: 'Transaction Details',
                      options: FFButtonOptions(
                        width: 170,
                        height: 40,
                        color: flutterMaterialTheme.of(context).dark400,
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
                    FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrackCarWidget(),
                          ),
                        );
                      },
                      text: 'Track Ambulance',
                      options: FFButtonOptions(
                        width: 170,
                        height: 40,
                        color: flutterMaterialTheme.of(context).dark400,
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
            ),
          ],
        ),
      ),
    );
  }
}
