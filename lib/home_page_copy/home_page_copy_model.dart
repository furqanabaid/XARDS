import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_employee_widget.dart';
import '/components/add_new_firm_widget.dart';
import '/components/edit_employee_widget.dart';
import '/components/manage_profile_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/request_manager.dart';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HomePageCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<FirmRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<EmployeeRecord> simpleSearchResults2 = [];

  /// Query cache managers for this widget.

  final _employeesManager = StreamRequestManager<List<EmployeeRecord>>();
  Stream<List<EmployeeRecord>> employees({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EmployeeRecord>> Function() requestFn,
  }) =>
      _employeesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEmployeesCache() => _employeesManager.clear();
  void clearEmployeesCacheKey(String? uniqueKey) =>
      _employeesManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    textController2?.dispose();

    /// Dispose query cache managers for this widget.

    clearEmployeesCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
