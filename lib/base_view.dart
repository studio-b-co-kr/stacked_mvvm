import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

abstract class BaseView<VM extends BaseViewModel> extends StatelessWidget {
  final ContextWrapper _contextWrapper = ContextWrapper();

  VM get read => _context.read<VM>();

  VM get watch => _context.watch<VM>();

  BaseView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext buildContext) {
    _contextWrapper.context = buildContext;
    return body(buildContext);
  }

  Widget body(BuildContext buildContext);

  BuildContext get _context => _contextWrapper.context;
}

class ContextWrapper {
  BuildContext context;
}
