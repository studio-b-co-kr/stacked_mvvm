// ignore: must_be_immutable
import 'package:clean_architecture/clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'count_view.dart';
import 'home_view_model.dart';

class HomeView extends BaseView<HomeViewModel> {
  HomeView({Key key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            CountView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),
        onPressed: () => read.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
