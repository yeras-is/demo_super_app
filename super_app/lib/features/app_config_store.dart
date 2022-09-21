// ignore_for_file: depend_on_referenced_packages

import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'app_config_store.g.dart';

class AppConfig = AppConfigBase with _$AppConfig;

abstract class AppConfigBase with Store {
  @observable
  Brightness brightness = Brightness.light;

  @action
  Future<void> changeMode() async {
    brightness = brightness == Brightness.light ? Brightness.dark : Brightness.light;
  }
}
