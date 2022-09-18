import 'package:market/features/catalog/domain/models/catalog_model.dart';

abstract class CatalogRepository {
  Future<CatalogModel> getCatalog();
}
