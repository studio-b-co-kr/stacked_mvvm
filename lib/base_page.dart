part of 'stacked_mvvm.dart';

abstract class BasePage<VM extends BaseViewModel> extends BaseWidget<VM> {
  BasePage({Key key, VM viewModel}) : super(key: key, viewModel: viewModel) {
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
