part of 'stacked_mvvmvs.dart';

abstract class BaseWidget<VM extends BaseViewModel> extends StatelessWidget {
  final VM viewModel;

  BaseWidget({Key key, this.viewModel})
      : assert(viewModel != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VM>.reactive(
      viewModelBuilder: () => viewModel,
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        onListen(context, model.state);
        return body(context, model, child);
      },
    );
  }

  BindingView body(BuildContext context, VM viewModel, Widget child);

  onListen(BuildContext context, dynamic) {}
}
