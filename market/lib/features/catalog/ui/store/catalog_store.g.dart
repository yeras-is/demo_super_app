// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Catalog on CatalogBase, Store {
  late final _$catalogAtom =
      Atom(name: 'CatalogBase.catalog', context: context);

  @override
  CatalogModel? get catalog {
    _$catalogAtom.reportRead();
    return super.catalog;
  }

  @override
  set catalog(CatalogModel? value) {
    _$catalogAtom.reportWrite(value, super.catalog, () {
      super.catalog = value;
    });
  }

  late final _$CatalogBaseActionController =
      ActionController(name: 'CatalogBase', context: context);

  @override
  void load() {
    final _$actionInfo =
        _$CatalogBaseActionController.startAction(name: 'CatalogBase.load');
    try {
      return super.load();
    } finally {
      _$CatalogBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
catalog: ${catalog}
    ''';
  }
}
