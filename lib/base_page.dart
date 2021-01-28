part of 'stacked_mvvmvs.dart';

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

  @override
  void onListen(context, state) {
    // TODO: implement onListen
    return super.onListen(context, state);
  }
}
