import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_arch/clean_architecture.dart';

import 'home_view_model.dart';

class CountView extends BindingView<HomeViewModel> {
  CountView({Key key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Text('${watch.count}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}
