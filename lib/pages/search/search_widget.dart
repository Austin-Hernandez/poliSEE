import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nps_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    String? previousSearch,
  }) : this.previousSearch = previousSearch ?? '';

  /// The name of the candidate whose page the user is coming from
  final String previousSearch;

  static String routeName = 'Search';
  static String routePath = '/search';

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Search'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEARCH_PAGE_Search_ON_INIT_STATE');
      if (valueOrDefault(currentUserDocument?.loginCount, 0) == 3) {
        logFirebaseEvent('Search_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: NpsWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    _model.searchBarTextFieldTextController ??=
        TextEditingController(text: widget.previousSearch);
    _model.searchBarTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CandidatesRecord>>(
      future: queryCandidatesRecordOnce(
        queryBuilder: (candidatesRecord) =>
            candidatesRecord.orderBy('LastName'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFDCB656),
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
        List<CandidatesRecord> searchCandidatesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFDCB656),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.03, 0.21),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFFCE8B9),
                          borderRadius: BorderRadius.circular(8.0),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 375.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.9),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      4.0,
                                    ),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 20.0),
                            child: Container(
                              width: 201.0,
                              height: 201.0,
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        4.0,
                                      ),
                                    )
                                  ],
                                ),
                                child: Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    key: ValueKey('SearchBar-TextField_ewi7'),
                                    controller:
                                        _model.searchBarTextFieldTextController,
                                    focusNode:
                                        _model.searchBarTextFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.searchBarTextFieldTextController',
                                      Duration(milliseconds: 500),
                                      () => safeSetState(() {}),
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Search...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.karma(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFAB8424),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFFFF9EA),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .searchBarTextFieldTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              FlutterFlowDropDown<String>(
                                multiSelectController:
                                    _model.dropDownValueController ??=
                                        FormListFieldController<String>(
                                            _model.dropDownValue ??=
                                                List<String>.from(
                                  _model.defaultSearch ?? [],
                                )),
                                options: [
                                  'First name',
                                  'Last name',
                                  'Party',
                                  'District',
                                  'City or town'
                                ],
                                width: 120.0,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                hintText: 'Search By...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: true,
                                onMultiSelectChanged: (val) => safeSetState(
                                    () => _model.dropDownValue = val),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 0.0),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Builder(
                                    builder: (context) {
                                      final candidateList = searchCandidatesRecordList
                                          .where((e) =>
                                              (_model.dropDownValue!.contains(_model.allSearchOptions.elementAtOrNull(0)) &&
                                                  (functions.contains(_model.searchBarTextFieldTextController.text, e.firstName)! ||
                                                      functions.contains(
                                                          e.firstName,
                                                          _model
                                                              .searchBarTextFieldTextController
                                                              .text)!)) ||
                                              (_model.dropDownValue!.contains(_model.allSearchOptions.elementAtOrNull(1)) &&
                                                  (functions.contains(_model.searchBarTextFieldTextController.text, e.lastName)! ||
                                                      functions.contains(
                                                          e.lastName,
                                                          _model
                                                              .searchBarTextFieldTextController
                                                              .text)!)) ||
                                              (_model.dropDownValue!.contains(_model.allSearchOptions.elementAtOrNull(2)) &&
                                                  (functions.contains(_model.searchBarTextFieldTextController.text, e.party)! || functions.contains(e.party, _model.searchBarTextFieldTextController.text)!)) ||
                                              (_model.dropDownValue!.contains(_model.allSearchOptions.elementAtOrNull(3)) && (functions.contains(_model.searchBarTextFieldTextController.text, e.district)! || functions.contains(e.district, _model.searchBarTextFieldTextController.text)!)) ||
                                              (_model.dropDownValue!.contains(_model.allSearchOptions.elementAtOrNull(4)) && (functions.contains(_model.searchBarTextFieldTextController.text, e.cityTown)! || functions.contains(e.cityTown, _model.searchBarTextFieldTextController.text)!)))
                                          .toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: candidateList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 20.0),
                                        itemBuilder:
                                            (context, candidateListIndex) {
                                          final candidateListItem =
                                              candidateList[candidateListIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SEARCH_PAGE_Candidate-Card_ON_TAP');
                                              logFirebaseEvent(
                                                  'Candidate-Card_navigate_to');

                                              context.pushNamed(
                                                CandidateWidget.routeName,
                                                queryParameters: {
                                                  'lastName': serializeParam(
                                                    candidateListItem.lastName,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.9, 0.09),
                                                  child: Container(
                                                    width: 96.0,
                                                    height: 96.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      candidateListItem.image,
                                                      fit: BoxFit.cover,
                                                      alignment:
                                                          Alignment(-0.2, 0.0),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.3, 0.08),
                                                      child: Text(
                                                        '${candidateListItem.firstName} ${candidateListItem.lastName}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .karma(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF7D6A3D),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.3, 0.08),
                                                      child: Text(
                                                        '${functions.elipseString(candidateListItem.cityTown, 15)}, RI',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .karma(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF7D6A3D),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: SafeArea(
                      child: Container(
                        width: double.infinity,
                        height: 88.9,
                        decoration: BoxDecoration(
                          color: Color(0xFFDCB656),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 64.0,
                                buttonSize: 80.0,
                                fillColor: Color(0xFFFCE8B9),
                                icon: FaIcon(
                                  FontAwesomeIcons.search,
                                  color: Color(0xFFAB8424),
                                  size: 44.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            if ((valueOrDefault<bool>(
                                        currentUserDocument?.isAdmin, false) !=
                                    null) &&
                                valueOrDefault<bool>(
                                    currentUserDocument?.isAdmin, false))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderRadius: 64.0,
                                    buttonSize: 80.0,
                                    fillColor: Color(0xFFFCE8B9),
                                    icon: Icon(
                                      Icons.auto_awesome_rounded,
                                      color: Color(0xFFAB8424),
                                      size: 44.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SEARCH_auto_awesome_rounded_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context
                                          .pushNamed(AdminpageWidget.routeName);
                                    },
                                  ),
                                ),
                              ),
                            if (currentUserUid != '')
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  key: ValueKey('IconButton_8xsr'),
                                  borderRadius: 64.0,
                                  buttonSize: 80.0,
                                  fillColor: Color(0xFFAB8424),
                                  icon: Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 40.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SEARCH_PAGE_star_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(
                                        FavoriteCandidateWidget.routeName);
                                  },
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 64.0,
                                buttonSize: 80.0,
                                fillColor: Color(0xFFAB8424),
                                icon: Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 40.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SEARCH_PAGE_person_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(LoginWidget.routeName);
                                },
                              ),
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
        );
      },
    );
  }
}
