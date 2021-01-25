part of 'clean_architecture.dart';

abstract class BasePage<S, VM extends BaseViewModel<S>>
    extends BaseWidget<S, VM> {
  BasePage({Key key, VM viewModel, BindingView<VM> view})
      : assert(view != null),
        assert(viewModel != null),
        super(key: key, viewModel: viewModel, view: view) {
    onCreated();
  }

  @mustCallSuper
  onCreated() async {
    dev.log("onCreated", name: "BasePage:$key");
    logScreenOpen();
  }

  Future logScreenOpen();

  String get screenName;
}
