import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch/clean_architecture.dart';

class HomeViewModel extends BaseViewModel {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyOnly(state: HomeState.First);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }

  @override
  get initState => HomeState.Init;
}

enum HomeState {
  Init,
  First,
  Second,
}
