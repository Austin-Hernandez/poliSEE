import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  List<String> defaultSearch = [
    'First name',
    'Last name',
    'Party',
    'District',
    'City or town'
  ];
  void addToDefaultSearch(String item) => defaultSearch.add(item);
  void removeFromDefaultSearch(String item) => defaultSearch.remove(item);
  void removeAtIndexFromDefaultSearch(int index) =>
      defaultSearch.removeAt(index);
  void insertAtIndexInDefaultSearch(int index, String item) =>
      defaultSearch.insert(index, item);
  void updateDefaultSearchAtIndex(int index, Function(String) updateFn) =>
      defaultSearch[index] = updateFn(defaultSearch[index]);

  /// Fsr you can only check if the selected item from a dropdown matches a
  /// variable, because that makes sense.
  ///
  /// Why let me just type in what I'm looking for? I'll just make a whole list
  /// variable and have me index it, that won't make it even more eligible, not
  /// even a little bit!
  List<String> allSearchOptions = [
    'First name',
    'Last name',
    'Party',
    'District',
    'City or town'
  ];
  void addToAllSearchOptions(String item) => allSearchOptions.add(item);
  void removeFromAllSearchOptions(String item) => allSearchOptions.remove(item);
  void removeAtIndexFromAllSearchOptions(int index) =>
      allSearchOptions.removeAt(index);
  void insertAtIndexInAllSearchOptions(int index, String item) =>
      allSearchOptions.insert(index, item);
  void updateAllSearchOptionsAtIndex(int index, Function(String) updateFn) =>
      allSearchOptions[index] = updateFn(allSearchOptions[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchBar-TextField widget.
  FocusNode? searchBarTextFieldFocusNode;
  TextEditingController? searchBarTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchBarTextFieldTextControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarTextFieldFocusNode?.dispose();
    searchBarTextFieldTextController?.dispose();
  }
}
