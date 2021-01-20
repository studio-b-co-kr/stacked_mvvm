import 'dart:developer' as dev;

import 'base_view_model.dart';
import 'base_widget.dart';

abstract class BasePage<VM extends BaseViewModel> extends BaseWidget<VM> {
  BasePage(
      {Key key,
      VM viewModel,
      ViewBuilder builder,
      Function(BuildContext context) onListen})
      : super(
            key: key,
            viewModel: viewModel,
            builder: builder,
            onListen: onListen) {
    onCreated();
  }

  onCreated() async {
    dev.log("onCreated", name: "BasePage:$key");
  }
}
