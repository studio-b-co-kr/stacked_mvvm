import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

part 'base_model.dart';

part 'base_page.dart';

part 'base_view_model.dart';

part 'base_widget.dart';

part 'binding_view.dart';

typedef BindingView<BaseViewModel> ViewBuilder(BuildContext context);

class _BaseViewModelWidget<VM extends BaseViewModel>
    extends ChangeNotifierProvider<VM> {
  _BaseViewModelWidget({
    Key key,
    VM viewModel,
    ViewBuilder builder,
    Function(BuildContext, dynamic) onListen,
  })  : assert(builder != null),
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
                    if (onListen != null) onListen(c1, viewModel?.state);
                    return viewModel.shouldUpdate;
                  },
                  builder: (c2, shouldUpdate, widget) {
                    dev.log("builder:$shouldUpdate", name: "BaseWidget:$key");
                    return shouldUpdate ? builder(c2) : widget;
                  },
                  child: builder(context),
                ));
}
