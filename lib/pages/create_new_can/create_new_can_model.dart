import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_new_can_widget.dart' show CreateNewCanWidget;
import 'package:flutter/material.dart';

class CreateNewCanModel extends FlutterFlowModel<CreateNewCanWidget> {
  ///  Local state fields for this page.

  String errorText = ' ';

  /// The image that appears in the circle when uploaded.
  String uploadedImage =
      'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAFoAhwMBIgACEQEDEQH/xAAVAAEBAAAAAAAAAAAAAAAAAAAAB//EABQQAQAAAAAAAAAAAAAAAAAAAAD/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AuIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/Z';

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for MiddleInitial widget.
  FocusNode? middleInitialFocusNode;
  TextEditingController? middleInitialTextController;
  String? Function(BuildContext, String?)? middleInitialTextControllerValidator;
  // State field(s) for District widget.
  FocusNode? districtFocusNode;
  TextEditingController? districtTextController;
  String? Function(BuildContext, String?)? districtTextControllerValidator;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for Party widget.
  FocusNode? partyFocusNode;
  TextEditingController? partyTextController;
  String? Function(BuildContext, String?)? partyTextControllerValidator;
  // State field(s) for CityTown widget.
  FocusNode? cityTownFocusNode;
  TextEditingController? cityTownTextController;
  String? Function(BuildContext, String?)? cityTownTextControllerValidator;
  // State field(s) for County widget.
  FocusNode? countyFocusNode;
  TextEditingController? countyTextController;
  String? Function(BuildContext, String?)? countyTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    middleInitialFocusNode?.dispose();
    middleInitialTextController?.dispose();

    districtFocusNode?.dispose();
    districtTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    partyFocusNode?.dispose();
    partyTextController?.dispose();

    cityTownFocusNode?.dispose();
    cityTownTextController?.dispose();

    countyFocusNode?.dispose();
    countyTextController?.dispose();
  }
}
