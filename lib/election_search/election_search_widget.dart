import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'election_search_model.dart';
export 'election_search_model.dart';

class ElectionSearchWidget extends StatefulWidget {
  const ElectionSearchWidget({super.key});

  static String routeName = 'electionSearch';
  static String routePath = '/electionSearch';

  @override
  State<ElectionSearchWidget> createState() => _ElectionSearchWidgetState();
}

class _ElectionSearchWidgetState extends State<ElectionSearchWidget> {
  late ElectionSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ElectionSearchModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'electionSearch'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<ApiCallResponse>(
                future: RepresentativeInfoByDivisionCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final textRepresentativeInfoByDivisionResponse =
                      snapshot.data!;

                  return Text(
                    valueOrDefault<String>(
                      RepresentativeInfoByDivisionCall.officialName(
                        textRepresentativeInfoByDivisionResponse.jsonBody,
                      )?.length.toString(),
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
