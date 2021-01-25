import 'package:example/repository/i_home_repository.dart';
import 'package:flutter_clean_arch/base_view_model_widget.dart';

abstract class IHomeViewModel
    extends BaseViewModel<HomeViewState, IHomeRepository> {}

enum HomeViewState {
  Init,
  First,
  Second,
}
