import 'package:clean_architecture/clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_view.dart';
import 'home_view_model.dart';

class HomePage extends BasePage<HomeViewModel> {
  static const ROUTE_NAME = "/";

  HomePage({Key key, HomeViewModel viewModel})
      : super(key: key, viewModel: viewModel);

  static Route<dynamic> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => HomePage(viewModel: HomeViewModel()),
    );
  }

  @override
  BaseView<BaseViewModel> buildView(BuildContext buildContext) {
    return HomeView();
  }

  @override
  Future loggingOpen() async {}

  @override
  String get screenName => "splash";
}
