import 'package:dependencies/dependencies.dart';
import 'package:market/features/catalog/domain/models/catalog_model.dart';
import 'package:market/features/catalog/domain/services/catalog_repository.dart';

part 'catalog_store.g.dart';

class Catalog = CatalogBase with _$Catalog;

abstract class CatalogBase with Store {
  final _repo = Modular.get<CatalogRepository>();

  @observable
  CatalogModel? catalog;

  @action
  void load() {
    _repo.getCatalog().then((value) => catalog = value);
  }
}
