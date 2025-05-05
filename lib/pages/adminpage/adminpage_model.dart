import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'adminpage_widget.dart' show AdminpageWidget;
import 'package:flutter/material.dart';

class AdminpageModel extends FlutterFlowModel<AdminpageWidget> {
  ///  Local state fields for this page.
  /// Page state that can be updated by the News Articles button.
  ///
  /// Linking the listview with the API call did not update the listview.
  List<String> articleUrlList = [];
  void addToArticleUrlList(String item) => articleUrlList.add(item);
  void removeFromArticleUrlList(String item) => articleUrlList.remove(item);
  void removeAtIndexFromArticleUrlList(int index) =>
      articleUrlList.removeAt(index);
  void insertAtIndexInArticleUrlList(int index, String item) =>
      articleUrlList.insert(index, item);
  void updateArticleUrlListAtIndex(int index, Function(String) updateFn) =>
      articleUrlList[index] = updateFn(articleUrlList[index]);

  /// What the AI response box says when not given a URI.
  String aiErrorMessage = 'Please submit a valid URL.';

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchBar-TextField widget.
  FocusNode? searchBarTextFieldFocusNode;
  TextEditingController? searchBarTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchBarTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GNews)] action in Articles-Button widget.
  ApiCallResponse? gnewsCall;
  // State field(s) for AIInput-Field widget.
  FocusNode? aIInputFieldFocusNode;
  TextEditingController? aIInputFieldTextController;
  String? Function(BuildContext, String?)? aIInputFieldTextControllerValidator;
  // Stores action output result for [AI Agent - Send Message to Summarize] action in GenAI-Button widget.
  String? summarizedArticle;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarTextFieldFocusNode?.dispose();
    searchBarTextFieldTextController?.dispose();

    aIInputFieldFocusNode?.dispose();
    aIInputFieldTextController?.dispose();
  }
}
