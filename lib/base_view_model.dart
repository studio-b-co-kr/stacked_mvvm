import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

export 'package:flutter/widgets.dart';

abstract class BaseViewModel<S> with ChangeNotifier, DiagnosticableTreeMixin {
  S state;
  bool _shouldUpdate = false;

  @mustCallSuper
  BaseViewModel() {
    state = initState;
  }

  S get initState;

  bool get shouldUpdate => _shouldUpdate;

  /// use this method to update ui
  _notifyAndBuildUi({S state}) {
    this.state = state ?? this.state;
    _shouldUpdate = true;
    notifyListeners();
  }

  /// use this method to move other screen or show popup
  notifyOnly({S state}) {
    this.state = state ?? this.state;
    _shouldUpdate = false;
    notifyListeners();
  }

  @mustCallSuper
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty('state', state));
  }
}
