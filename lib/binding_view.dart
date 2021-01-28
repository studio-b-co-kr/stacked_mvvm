part of 'stacked_mvvmvs.dart';

abstract class BindingView<VM extends BaseViewModel>
    extends ViewModelWidget<VM> {
  BindingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, VM viewModel);
}
