part of 'clean_architecture.dart';

class BaseWidget<S, VM extends BaseViewModel<S>> extends StatelessWidget {
  final Key key;
  final VM viewModel;
  final BindingView<VM> view;

  BaseWidget({this.key, this.viewModel, this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewModelWidget(
        viewModel: this.viewModel,
        builder: (context) {
          return view;
        },
        onListen: (ctx, state) {
          onListen(ctx, state);
        });
  }

  onListen(BuildContext context, S state) {
    dev.log("onListen:state = $state", name: "BaseWidget:$key");
  }
}
