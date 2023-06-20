import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'no_dat_found_model.dart';
export 'no_dat_found_model.dart';

class NoDatFoundWidget extends StatefulWidget {
  const NoDatFoundWidget({Key? key}) : super(key: key);

  @override
  _NoDatFoundWidgetState createState() => _NoDatFoundWidgetState();
}

class _NoDatFoundWidgetState extends State<NoDatFoundWidget> {
  late NoDatFoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDatFoundModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(),
          child: Lottie.network(
            'https://assets2.lottiefiles.com/packages/lf20_oga1x3jk.json',
            width: 250.0,
            height: 250.0,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),
      ],
    );
  }
}
