import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_arch/clean_architecture.dart';

import 'home_view.dart';
import 'home_view_model.dart';

class HomePage extends BasePage<HomeViewModel> {
  static const ROUTE_NAME = "/";

  HomePage({Key key, HomeViewModel viewModel, ViewBuilder builder})
      : super(key: key, viewModel: viewModel, builder: builder);

  static Route<dynamic> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => HomePage(
        key: LabeledGlobalKey("HomePage"),
        viewModel: HomeViewModel(),
        builder: (context) => HomeView(key: LabeledGlobalKey("HomeView")),
      ),
    );
  }

  Future loggingOpen() async {}

  String get screenName => "splash";
}
