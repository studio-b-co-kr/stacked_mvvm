part of 'clean_architecture.dart';

abstract class BindingView<VM extends BaseViewModel> extends StatelessWidget {
  final ContextWrapper _contextWrapper = ContextWrapper();

  VM get read => _context.read<VM>();

  VM get watch => _context.watch<VM>();

  BindingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext buildContext) {
    _contextWrapper.context = buildContext;
    dev.log("build", name: "BaseView:$key");
    return body(buildContext);
  }

  Widget body(BuildContext buildContext);

  BuildContext get _context => _contextWrapper.context;
}

class ContextWrapper {
  BuildContext context;
}
