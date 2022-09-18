import 'dart:convert';

import 'package:market/features/catalog/domain/models/catalog_model.dart';
import 'package:market/features/catalog/domain/services/catalog_repository.dart';
import 'package:http/http.dart';

class DummyCatalogRepository extends CatalogRepository {
  DummyCatalogRepository();

  @override
  Future<CatalogModel> getCatalog() async {
    final response = await get(Uri.parse('https://dummyjson.com/products'));
    return CatalogModel.fromJson(jsonDecode(response.body));
  }
}
