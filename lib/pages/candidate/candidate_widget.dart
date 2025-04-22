import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'candidate_model.dart';
export 'candidate_model.dart';

class CandidateWidget extends StatefulWidget {
  const CandidateWidget({
    super.key,
    required this.lastName,
  });

  /// The last name of the searched-for candidate
  final String? lastName;

  static String routeName = 'Candidate';
  static String routePath = '/candidate';

  @override
  State<CandidateWidget> createState() => _CandidateWidgetState();
}

class _CandidateWidgetState extends State<CandidateWidget> {
  late CandidateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CandidateModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Candidate'});

    _model.summaryTextFieldFocusNode ??= FocusNode();

    _model.policyKeyIssuesTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CandidatesRecord>>(
      stream: queryCandidatesRecord(
        queryBuilder: (candidatesRecord) => candidatesRecord.where(
          'LastName',
          isEqualTo: widget.lastName,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFCDA237),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CandidatesRecord> candidateCandidatesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final candidateCandidatesRecord =
            candidateCandidatesRecordList.isNotEmpty
                ? candidateCandidatesRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFCDA237),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: SafeArea(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFCE8B9),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -0.76),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 75.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF7D6A3D),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (valueOrDefault<bool>(
                                          getRemoteConfigBool('LogoDisplayed'),
                                          true,
                                        ))
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.0, -0.97),
                                            child: Container(
                                              width: 63.0,
                                              height: 63.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Container(
                                                width: 200.0,
                                                height: 200.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Poli-SEE-Transparent-App-Icon.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.9, -0.95),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            icon: Icon(
                                              Icons.menu_sharp,
                                              color: Color(0xFF7D6A3D),
                                              size: 35.0,
                                            ),
                                            onPressed: () {
                                              print(
                                                  'Menu-IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.9, -0.95),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            icon: Icon(
                                              Icons.search,
                                              color: Color(0xFF7D6A3D),
                                              size: 35.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CANDIDATE_PAGE_Search-IconButton_ON_TAP');
                                              logFirebaseEvent(
                                                  'Search-IconButton_navigate_to');

                                              context.pushNamed(
                                                SearchWidget.routeName,
                                                queryParameters: {
                                                  'previousSearch':
                                                      serializeParam(
                                                    '${candidateCandidatesRecord?.firstName} ${widget.lastName}',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.22),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if ((valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) !=
                                                null) &&
                                            valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'CANDIDATE_PAGE_UPDATEPOLICYSUM_ON_TAP');
                                                    logFirebaseEvent(
                                                        'UPDATEPOLICYSUM_backend_call');

                                                    await candidateCandidatesRecord!
                                                        .reference
                                                        .update(
                                                            createCandidatesRecordData(
                                                      policySum: _model
                                                          .policyKeyIssuesTextFieldTextController
                                                          .text,
                                                      summary: _model
                                                          .summaryTextFieldTextController
                                                          .text,
                                                    ));
                                                  },
                                                  text: 'UPDATE',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFF3971EF),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) !=
                                                null) &&
                                            valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'CANDIDATE_PAGE_DELETE_ON_TAP');
                                                  logFirebaseEvent(
                                                      'DELETE_alert_dialog');
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Delete${candidateCandidatesRecord?.firstName} ${candidateCandidatesRecord?.lastName}?'),
                                                                content: Text(
                                                                    'This cannot be undone'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Delete'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    logFirebaseEvent(
                                                        'DELETE_navigate_to');

                                                    context.pushNamed(
                                                        AdminpageWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'DELETE_backend_call');
                                                    await candidateCandidatesRecord!
                                                        .reference
                                                        .delete();
                                                  }
                                                },
                                                text: 'DELETE',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFEF393C),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Inter Tight',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 375.0,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(
                                              -0.72, -0.88),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      6.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  candidateCandidatesRecord!
                                                      .image,
                                                  width: 152.0,
                                                  height: 205.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.9, -0.99),
                                          child: Padding(
                                            padding: EdgeInsets.all(24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '${candidateCandidatesRecord.firstName} ${candidateCandidatesRecord.lastName}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Karma',
                                                          color:
                                                              Color(0xFF3C2D08),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      candidateCandidatesRecord
                                                          .age
                                                          .toString(),
                                                      'Age',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Karma',
                                                          color:
                                                              Color(0xFF3C2D08),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      candidateCandidatesRecord
                                                          .party,
                                                      'NoPartyGiven',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Karma',
                                                          color:
                                                              Color(0xFF3C2D08),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(
                                              -0.15, -0.95),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 50.0,
                                              icon: Icon(
                                                Icons.star,
                                                color: Color(0xFFFFCC00),
                                                size: 30.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: SafeArea(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Text(
                                              'Summary',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Karma',
                                                        color:
                                                            Color(0xFF3C2D08),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      6.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Container(
                                                  width: 300.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                            .summaryTextFieldTextController ??=
                                                        TextEditingController(
                                                      text:
                                                          candidateCandidatesRecord
                                                              .summary,
                                                    ),
                                                    focusNode: _model
                                                        .summaryTextFieldFocusNode,
                                                    autofocus: false,
                                                    readOnly: valueOrDefault<
                                                                bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ==
                                                        false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Karma',
                                                                color: Color(
                                                                    0xFF3C2D08),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      alignLabelWithHint: false,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Karma',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFAB8424),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Karma',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLines: 25,
                                                    minLines: 3,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .summaryTextFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Text(
                                              'Policy on Key Issues',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Karma',
                                                        color:
                                                            Color(0xFF3C2D08),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 0.0),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Container(
                                                  width: 300.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                            .policyKeyIssuesTextFieldTextController ??=
                                                        TextEditingController(
                                                      text:
                                                          candidateCandidatesRecord
                                                              .policySum,
                                                    ),
                                                    focusNode: _model
                                                        .policyKeyIssuesTextFieldFocusNode,
                                                    autofocus: false,
                                                    readOnly: valueOrDefault<
                                                                bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ==
                                                        false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Color(
                                                                    0xFF3C2D08),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Karma',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFAB8424),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Karma',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLines: 25,
                                                    minLines: 3,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .policyKeyIssuesTextFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 300.2,
                                height: 166.5,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Was this article useful?',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Karma',
                                              color: Color(0xFF3C2D08),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                                  'CANDIDATE_thumb_up_alt_rounded_ICN_ON_TA');
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              await WtaufeedbackRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createWtaufeedbackRecordData(
                                                    like: false,
                                                    candidateName:
                                                        widget.lastName,
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
                                                  'CANDIDATE_thumb_down_alt_rounded_ICN_ON_');
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              await WtaufeedbackRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createWtaufeedbackRecordData(
                                                    dislike: false,
                                                    candidateName:
                                                        widget.lastName,
                                                  ));
                                            },
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Thank you for your feedback!',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Karma',
                                              color: Color(0xFF3C2D08),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
