// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppConfig on AppConfigBase, Store {
  late final _$brightnessAtom =
      Atom(name: 'AppConfigBase.brightness', context: context);

  @override
  Brightness get brightness {
    _$brightnessAtom.reportRead();
    return super.brightness;
  }

  @override
  set brightness(Brightness value) {
    _$brightnessAtom.reportWrite(value, super.brightness, () {
      super.brightness = value;
    });
  }

  late final _$AppConfigBaseActionController =
      ActionController(name: 'AppConfigBase', context: context);

  @override
  Future<void> changeMode() {
    final _$actionInfo = _$AppConfigBaseActionController.startAction(
        name: 'AppConfigBase.changeMode');
    try {
      return super.changeMode();
    } finally {
      _$AppConfigBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
brightness: ${brightness}
    ''';
  }
}
