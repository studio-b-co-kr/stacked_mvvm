import 'package:example/feature/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_arch/clean_architecture.dart';

import 'home_view.dart';

class HomePage extends BasePage<HomeState, HomeViewModel> {
  static const ROUTE_NAME = "/";

  HomePage({Key key, HomeViewModel viewModel, HomeView view})
      : super(key: key, viewModel: viewModel, view: view);

  static Route<dynamic> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => HomePage(
        key: LabeledGlobalKey("HomePage"),
        viewModel: HomeViewModel(),
        view: HomeView(key: LabeledGlobalKey("HomeView")),
      ),
    );
  }

  @override
  String get screenName => "splash";

  @override
  Future logScreenOpen() async {}
}
