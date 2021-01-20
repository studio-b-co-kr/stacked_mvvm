import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'base_view_model_widget.dart';

part 'base_model.dart';

part 'base_page.dart';

part 'binding_view.dart';

part 'base_view_model.dart';

part 'base_widget.dart';

typedef BindingView<BaseViewModel> ViewBuilder(BuildContext context);
