import 'dart:ffi';

import 'package:flutter/widgets.dart';

const defaultScrollPhisycs = BouncingScrollPhysics();

extension Pricelable on int {
  String get withPricelable => '$this تومان';
}
