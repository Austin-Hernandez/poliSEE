import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wtau_model.dart';
export 'wtau_model.dart';

class WtauWidget extends StatefulWidget {
  const WtauWidget({super.key});

  @override
  State<WtauWidget> createState() => _WtauWidgetState();
}

class _WtauWidgetState extends State<WtauWidget> {
  late WtauModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WtauModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFCE8B9),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Color(0xFFAB8424),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Was this article useful?',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.karma(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: Color(0xFF3C2D08),
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          fillColor: Color(0xFFAB8424),
                          icon: Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Color(0xFFFFF9EA),
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'WTAU_thumb_up_alt_rounded_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_backend_call');

                            await WtaufeedbackRecord.collection
                                .doc()
                                .set(createWtaufeedbackRecordData(
                                  like: false,
                                  candidateName:
                                      FFDevEnvironmentValues.currentEnvironment,
                                ));
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          fillColor: Color(0xFFFFF9EA),
                          icon: Icon(
                            Icons.thumb_down_alt_rounded,
                            color: Color(0xFFAB8424),
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'WTAU_thumb_down_alt_rounded_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_backend_call');

                            await WtaufeedbackRecord.collection
                                .doc()
                                .set(createWtaufeedbackRecordData(
                                  dislike: false,
                                ));
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Thank you for your feedback!',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.karma(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF3C2D08),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.87, 0.78),
            child: Container(
              width: 120.8,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
