import 'package:flutter/material.dart';

void unFocusPrimaryFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}
