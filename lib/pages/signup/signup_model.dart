import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email-Signup widget.
  FocusNode? emailSignupFocusNode;
  TextEditingController? emailSignupTextController;
  String? Function(BuildContext, String?)? emailSignupTextControllerValidator;
  String? _emailSignupTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email... is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for Password-Signup widget.
  FocusNode? passwordSignupFocusNode;
  TextEditingController? passwordSignupTextController;
  late bool passwordSignupVisibility;
  String? Function(BuildContext, String?)?
      passwordSignupTextControllerValidator;
  String? _passwordSignupTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password... is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // State field(s) for ConfirmPassword-Signup widget.
  FocusNode? confirmPasswordSignupFocusNode;
  TextEditingController? confirmPasswordSignupTextController;
  late bool confirmPasswordSignupVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordSignupTextControllerValidator;
  String? _confirmPasswordSignupTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password... is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailSignupTextControllerValidator = _emailSignupTextControllerValidator;
    passwordSignupVisibility = false;
    passwordSignupTextControllerValidator =
        _passwordSignupTextControllerValidator;
    confirmPasswordSignupVisibility = false;
    confirmPasswordSignupTextControllerValidator =
        _confirmPasswordSignupTextControllerValidator;
  }

  @override
  void dispose() {
    emailSignupFocusNode?.dispose();
    emailSignupTextController?.dispose();

    passwordSignupFocusNode?.dispose();
    passwordSignupTextController?.dispose();

    confirmPasswordSignupFocusNode?.dispose();
    confirmPasswordSignupTextController?.dispose();
  }
}
