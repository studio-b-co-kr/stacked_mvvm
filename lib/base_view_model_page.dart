import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';
import 'base_view_model.dart';

abstract class BasePage<VM extends BaseViewModel> extends StatelessWidget {
  final VM viewModel;

  BasePage({Key key, this.viewModel}) : super(key: key) {
    Future.microtask(() async {
      viewModel?.addListener(() {
        onListen(viewModel.state);
      });

      viewModel?.notifyOnly(state: viewModel?.initState);
      // TODO send page open event to log server(firebase and etc..)
      loggingOpen();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel == null) {
      return buildView(context);
    }

    return ChangeNotifierProvider(
      create: (_) => viewModel,
      builder: (context, widget) => Selector<VM, bool>(
        shouldRebuild: (previous, shouldUpdate) => shouldUpdate,
        selector: (context, viewModel) => viewModel.shouldUpdate,
        builder: (context, shouldUpdate, widget) =>
            shouldUpdate ? buildView(context) : widget,
        child: buildView(context),
      ),
    );
  }

  BaseView buildView(BuildContext buildContext);

  Future loggingOpen();

  void onListen(dynamic state) {}

  String get screenName;
}
