part of 'stacked_mvvm.dart';

abstract class BaseViewModel<S, R extends BaseRepository>
    with ChangeNotifier, DiagnosticableTreeMixin {
  S state;
  final R repository;

  @mustCallSuper
  BaseViewModel({this.repository}) {
    state = initState;
  }

  S get initState;

  /// use this method to move other screen or show popup
  update({S state}) {
    this.state = state;
    notifyListeners();
  }

  init() {}

  @mustCallSuper
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty('state', state));
  }
}
