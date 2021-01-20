import 'dart:developer' as dev;

import 'package:provider/provider.dart';

import 'base_view.dart';
import 'base_view_model.dart';

typedef BaseView<BaseViewModel> ViewBuilder(BuildContext context);

abstract class BaseWidget<VM extends BaseViewModel>
    extends ChangeNotifierProvider<VM> {
  /// handle state to change page or show dialog.
  final Function(BuildContext context) onListen;

  BaseWidget({Key key, VM viewModel, ViewBuilder builder, this.onListen})
      : assert(builder != null),
        assert(viewModel != null),
        super(
            key: key,
            create: (_) => viewModel,
            builder: (context, widget) => Selector<VM, bool>(
                  shouldRebuild: (previous, shouldUpdate) {
                    dev.log("shouldUpdate:$shouldUpdate",
                        name: "BaseWidget:$key");
                    return shouldUpdate;
                  },
                  selector: (c1, viewModel) {
                    dev.log(
                        "selector:${viewModel.shouldUpdate}, viewModel.state = ${viewModel?.state}",
                        name: "BaseWidget:$key");
                    if (onListen != null) onListen(c1);
                    return viewModel.shouldUpdate;
                  },
                  builder: (c2, shouldUpdate, widget) {
                    dev.log("builder:$shouldUpdate", name: "BaseWidget:$key");
                    return shouldUpdate ? builder(c2) : widget;
                  },
                  child: builder(context),
                ));
}
