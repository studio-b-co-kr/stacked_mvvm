part of 'base_view_model_widget.dart';

class BaseWidget<S, R extends BaseRepository, VM extends BaseViewModel<S, R>>
    extends StatelessWidget {
  final Key key;
  final VM viewModel;
  final BindingView<VM> view;

  BaseWidget({this.key, this.viewModel, this.view})
      : assert(view != null),
        assert(viewModel != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseViewModelWidget<S, R, VM>(
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
