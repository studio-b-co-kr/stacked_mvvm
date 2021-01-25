import 'package:example/viewmodel/i_home_viewmodel.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends IHomeViewModel {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    update(state: HomeViewState.First);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }

  @override
  get initState => HomeViewState.Init;
}
