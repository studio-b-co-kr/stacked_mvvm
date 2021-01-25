part of 'base_view_model_widget.dart';

abstract class BaseViewModel<S, R extends BaseRepository>
    with ChangeNotifier, DiagnosticableTreeMixin {
  S state;
  bool _shouldUpdate = false;
  final R repository;

  @mustCallSuper
  BaseViewModel({this.repository}) {
    state = initState;
  }

  S get initState;

  bool get shouldUpdate => _shouldUpdate;

  /// use this method to move other screen or show popup
  update({S state}) {
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
