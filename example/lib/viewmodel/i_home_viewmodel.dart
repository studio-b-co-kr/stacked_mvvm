import 'package:example/repository/i_home_repository.dart';
import 'package:flutter_clean_arch/stacked_mvvmvs.dart';

abstract class IHomeViewModel
    extends BaseViewModel<HomeViewState, IHomeRepository> {
  int count;

  increment();
}

enum HomeViewState {
  Init,
  First,
  Second,
}
