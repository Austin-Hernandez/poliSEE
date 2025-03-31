import '/components/wtau_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'candidate_widget.dart' show CandidateWidget;
import 'package:flutter/material.dart';

class CandidateModel extends FlutterFlowModel<CandidateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Summary-TextField widget.
  FocusNode? summaryTextFieldFocusNode;
  TextEditingController? summaryTextFieldTextController;
  String? Function(BuildContext, String?)?
      summaryTextFieldTextControllerValidator;
  // State field(s) for PolicyKeyIssues-TextField widget.
  FocusNode? policyKeyIssuesTextFieldFocusNode;
  TextEditingController? policyKeyIssuesTextFieldTextController;
  String? Function(BuildContext, String?)?
      policyKeyIssuesTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    summaryTextFieldFocusNode?.dispose();
    summaryTextFieldTextController?.dispose();

    policyKeyIssuesTextFieldFocusNode?.dispose();
    policyKeyIssuesTextFieldTextController?.dispose();
  }

  /// Action blocks.
  Future wtaupopup(BuildContext context) async {
    logFirebaseEvent('wtaupopup_bottom_sheet');
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Color(0xFFAB8424),
      isDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: WtauWidget(),
          ),
        );
      },
    );
  }
}
