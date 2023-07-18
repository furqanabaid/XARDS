import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for forgotPasswordEmail widget.
  TextEditingController? forgotPasswordEmailController;
  String? Function(BuildContext, String?)?
      forgotPasswordEmailControllerValidator;
  // State field(s) for signInEmail widget.
  TextEditingController? signInEmailController;
  String? Function(BuildContext, String?)? signInEmailControllerValidator;
  // State field(s) for signInPassword widget.
  TextEditingController? signInPasswordController;
  late bool signInPasswordVisibility;
  String? Function(BuildContext, String?)? signInPasswordControllerValidator;
  // State field(s) for FullName widget.
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  String? _fullNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ix4w72fl' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for signUpEmail widget.
  TextEditingController? signUpEmailController;
  String? Function(BuildContext, String?)? signUpEmailControllerValidator;
  String? _signUpEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0lfetkcf' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for signUpPasword widget.
  TextEditingController? signUpPaswordController;
  late bool signUpPaswordVisibility;
  String? Function(BuildContext, String?)? signUpPaswordControllerValidator;
  String? _signUpPaswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jsw0qgid' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for C_signUpPassword widget.
  TextEditingController? cSignUpPasswordController;
  late bool cSignUpPasswordVisibility;
  String? Function(BuildContext, String?)? cSignUpPasswordControllerValidator;
  String? _cSignUpPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n3ygzdja' /* Field is required */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    signInPasswordVisibility = false;
    fullNameControllerValidator = _fullNameControllerValidator;
    signUpEmailControllerValidator = _signUpEmailControllerValidator;
    signUpPaswordVisibility = false;
    signUpPaswordControllerValidator = _signUpPaswordControllerValidator;
    cSignUpPasswordVisibility = false;
    cSignUpPasswordControllerValidator = _cSignUpPasswordControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    forgotPasswordEmailController?.dispose();
    signInEmailController?.dispose();
    signInPasswordController?.dispose();
    fullNameController?.dispose();
    signUpEmailController?.dispose();
    signUpPaswordController?.dispose();
    cSignUpPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
