part of 'base_view_model_widget.dart';

abstract class BasePage<S, R extends BaseRepository,
    VM extends BaseViewModel<S, R>> extends BaseWidget<S, R, VM> {
  BasePage({Key key, VM viewModel, R repository, BindingView<VM> view})
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
