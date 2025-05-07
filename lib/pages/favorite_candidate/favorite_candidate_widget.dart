import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favorite_candidate_model.dart';
export 'favorite_candidate_model.dart';

class FavoriteCandidateWidget extends StatefulWidget {
  const FavoriteCandidateWidget({super.key});

  static String routeName = 'FavoriteCandidate';
  static String routePath = '/favoriteCandidate';

  @override
  State<FavoriteCandidateWidget> createState() =>
      _FavoriteCandidateWidgetState();
}

class _FavoriteCandidateWidgetState extends State<FavoriteCandidateWidget> {
  late FavoriteCandidateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteCandidateModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FavoriteCandidate'});
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
        backgroundColor: Color(0xFFCDA237),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                        alignment:
                                            AlignmentDirectional(0.0, -0.97),
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
                                              'FAVORITE_CANDIDATE_Search-IconButton_ON_');
                                          logFirebaseEvent(
                                              'Search-IconButton_navigate_to');

                                          context.pushNamed(
                                            SearchWidget.routeName,
                                            queryParameters: {
                                              'previousSearch': serializeParam(
                                                '',
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: SafeArea(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final favList = (currentUserDocument
                                                        ?.favCan2
                                                        .toList() ??
                                                    [])
                                                .toList();

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 1.0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: favList.length,
                                              itemBuilder:
                                                  (context, favListIndex) {
                                                final favListItem =
                                                    favList[favListIndex];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF3D27D),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'FAVORITE_CANDIDATE_Candidate-Card_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Candidate-Card_navigate_to');

                                                        context.pushNamed(
                                                          CandidateWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'lastName':
                                                                serializeParam(
                                                              (currentUserDocument
                                                                          ?.favCanLastname
                                                                          .toList() ??
                                                                      [])
                                                                  .elementAtOrNull(
                                                                      favListIndex),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 96.0,
                                                                height: 96.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  (currentUserDocument
                                                                              ?.favCanImage
                                                                              .toList() ??
                                                                          [])
                                                                      .elementAtOrNull(
                                                                          favListIndex)!,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      Alignment(
                                                                          -0.2,
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              '${(currentUserDocument?.favCanName2.toList() ?? []).elementAtOrNull(favListIndex)} ${(currentUserDocument?.favCanLastname.toList() ?? []).elementAtOrNull(favListIndex)}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
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
  }
}
