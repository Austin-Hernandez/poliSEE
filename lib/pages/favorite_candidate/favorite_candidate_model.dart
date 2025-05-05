import '/components/wtau_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favorite_candidate_widget.dart' show FavoriteCandidateWidget;
import 'package:flutter/material.dart';

class FavoriteCandidateModel extends FlutterFlowModel<FavoriteCandidateWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

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
