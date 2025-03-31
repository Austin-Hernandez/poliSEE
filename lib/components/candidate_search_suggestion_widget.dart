import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'candidate_search_suggestion_model.dart';
export 'candidate_search_suggestion_model.dart';

/// A clickable widget containing the photo, name, city/town, and party.
class CandidateSearchSuggestionWidget extends StatefulWidget {
  const CandidateSearchSuggestionWidget({super.key});

  @override
  State<CandidateSearchSuggestionWidget> createState() =>
      _CandidateSearchSuggestionWidgetState();
}

class _CandidateSearchSuggestionWidgetState
    extends State<CandidateSearchSuggestionWidget> {
  late CandidateSearchSuggestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CandidateSearchSuggestionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.9, 0.09),
                child: Container(
                  width: 96.0,
                  height: 96.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/Screenshot_2025-03-20_at_2.30.11_PM-removebg-preview.png',
                    fit: BoxFit.cover,
                    alignment: Alignment(-0.2, 0.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.3, 0.08),
                child: Text(
                  'Firstname Lastname\nHometown, RI',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Karma',
                        color: Color(0xFF7D6A3D),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
